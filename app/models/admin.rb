class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role
  belongs_to :role
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  attr_accessible :role, :role_id

  private
    def set_default_role
      self.role ||= Role.find_by_name('admin')
    end
end
