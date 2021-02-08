require 'rails_helper'
require_relative '../support/devise'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'validations' do
    let(:user) { create(:user) }

    it 'is valid' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is invalid without a username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'is invalid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end
  end

  context 'associations' do
    let(:user) { create(:user) }

    it 'responds to #entries' do
      expect(user).to respond_to(:entries)
    end
  end
end
