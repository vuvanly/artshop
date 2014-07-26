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

require 'rails_helper'

RSpec.describe Product, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
