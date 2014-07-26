# == Schema Information
#
# Table name: discounts
#
#  id         :uuid             not null, primary key
#  product_id :uuid
#  discount   :float
#  start_date :datetime
#  end_date   :datetime
#  date       :datetime
#  loop_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Discount < ActiveRecord::Base
  attr_accessible :product_id, :product, :discount
  attr_accessible :start_date, :end_date, :date, :loop_type

  belongs_to :product
end
