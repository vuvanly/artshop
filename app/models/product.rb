# == Schema Information
#
# Table name: products
#
#  id                  :uuid             not null, primary key
#  product_type_id     :uuid
#  product_category_id :uuid
#  name                :string(255)      not null
#  slug                :string(255)
#  short_desc          :text
#  description         :text
#  price               :float
#  deleted_at          :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

class Product < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :product_type, :product_type_id, :product_category, :product_category_id
  attr_accessible :price, :name, :slug, :short_desc, :description

  has_one :discount
  belongs_to :product_category
  belongs_to :product_type
end
