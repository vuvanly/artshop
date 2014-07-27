module SharedMethods
  # A simple module to generate SEO friendly slug to ActiveRecord class.
  # If you want something more complex, you can use 'friendly_id' gem.
  #
  # We don't want to auto-include this module to ActiveRecord::Base, who want it?
  # Just include this module where you want, please.
  module Sluggable
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.send(:extend, ClassMethods)
    end
    
    module InstanceMethods
      def to_param
        self[slug_field]
      end

      def set_slug
        if self[slug_field].blank?
          _base = self.send(slug_config[:base_field])
          _slug = self.class.normalize_slug(_base)
          self.send("#{slug_field}=", _slug)
        end
      end

      def slug_config
        self.class.slug_config
      end

      def slug_field
        self.slug_config[:slug_field]
      end

      protected :set_slug, :slug_config, :slug_field

    end # InstanceMethods
    
    module ClassMethods
      # Enable sluggable for a field.
      # 
      # class MyModel < ActiveRecord::Base
      #   slugged :name
      # end
      #
      # === Parameters
      #
      # base_field_name (String): name of field need slugging.
      #
      # options[:slug_field] (String): name of field to store slug. Default is 'slug'.
      #   
      def slugged(base_field_name, options = {})
        @slug_config = {
          slug_field: :slug
        }
        @slug_config.merge!(options)
        @slug_config[:base_field] = base_field_name

        before_validation :set_slug
        
        self.instance_eval do
          # Include finder method for both this model base and model relation object.
          # So that we can call find method from scope and model class.
          # Ex: ModelClass.find(id), ModelClass.my_scope.find(id), ...
          relation.class.send(:include, Sluggable::FindersMethod)
        end
      end

      # Generate slug from source value.
      def normalize_slug(value)
        value.to_s.parameterize
      end

      def slug_config
        @slug_config
      end

      def slug_field
        self.slug_config[:slug_field]
      end
    end # ClassMethods

    module FindersMethod
      def find(id)
        if id.is_a?(Array)
          super
        else
          id = id.to_s
          id_type = self.columns_hash['id'].type

          if (id_type == :uuid && id.match(UUID_REGEX)) || (id_type == :integer && ::Util.is_a_number?(id))
            record = self.where(id: id).first
            raise_record_not_found_exception!(id, 0, 1) unless record
            record
          else # Find by slug
            record = self.where(self.slug_field => id).first
            raise_slugged_record_not_found_exception!(id) unless record
            record
          end
        end
      end

      # This method is called whenever no records are found with slug. 
      def raise_slugged_record_not_found_exception!(slug)
        error = "Couldn't find #{self.name} with #{self.slug_field}=#{slug}"
        raise ActiveRecord::RecordNotFound, error
      end

      protected :raise_slugged_record_not_found_exception!
    end # FindersMethod
  end
end
