class Role < ActiveRecord::Base
  has_many :users

  ADMIN_ROLE = ['admin', 'mod']

  USER_ROLE = ['registered', 'banned']

  def self.roles 
    ADMIN_ROLE + USER_ROLE
  end
end
