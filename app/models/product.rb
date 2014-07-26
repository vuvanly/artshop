class Product < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :product_type, :product_type_id, :product_category, :product_category_id
  attr_accessible :price, :name, :slug, :short_desc, :description
end
