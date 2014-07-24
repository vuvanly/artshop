# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :users
  has_many :admins

  ADMIN_ROLE = ['admin', 'mod']

  USER_ROLE = ['registered', 'banned']

  def self.roles 
    ADMIN_ROLE + USER_ROLE
  end
end
