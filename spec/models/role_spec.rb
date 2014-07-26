# == Schema Information
#
# Table name: roles
#
#  id         :uuid             not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Role, :type => :model do
  let(:role) { create :role }
  describe 'associations' do 
    it {is_expected.to have_many(:users).dependent(:restrict_with_error) }
    it {is_expected.to have_many(:admins).dependent(:restrict_with_error) }
  end

  describe 'constants' do 
    it {expect(Role::ADMIN_ROLE).to eq(['admin', 'mod'])}
    it {expect(Role::USER_ROLE).to eq(['registered', 'banned'])}
  end

  describe 'class methods' do 
    describe 'roles' do 
      it {expect(Role.roles).to eq(Role::ADMIN_ROLE + Role::USER_ROLE)}
    end
  end
end
