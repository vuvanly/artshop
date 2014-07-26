# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  role_id                :integer
#  name                   :string(255)
#  username               :string(255)
#  phone                  :string(255)
#  deleted_at             :datetime
#

 :confirmable# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role_id                :integer
#  name                   :string(255)
#  username               :string(255)
#  phone                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  GENDERS = %w(male female)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :phone, :username, :authentications
  
  belongs_to :role

  before_create :set_default_role
  
  has_paper_trail

  acts_as_paranoid


  private
    def set_default_role
      self.role ||= Role.find_by_name('registered')
    end

end
