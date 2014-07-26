class ProductCategory < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :name, :slug, :position, :description
end