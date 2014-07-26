# == Schema Information
#
# Table name: product_types
#
#  id          :uuid             not null, primary key
#  name        :string(255)      not null
#  slug        :string(255)
#  description :text
#  position    :integer          default(-1)
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductType < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :name, :slug, :position, :description

  has_many :products
end
