# == Schema Information
#
# Table name: roles
#
#  id         :uuid             not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :users, dependent: :restrict_with_error
  has_many :admins, dependent: :restrict_with_error

  attr_accessible :name

  ADMIN_ROLE = ['admin', 'mod']

  USER_ROLE = ['registered', 'banned']

  # Class methods
  class << self
    def roles
      ADMIN_ROLE + USER_ROLE
    end
  end
end
