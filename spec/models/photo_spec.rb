require 'rails_helper'

RSpec.describe Photo, type: :model do

  let(:user) { create(:user) }
  let(:picture) { Photo.create(summary: "test photo", user_id: user.id) }

  it 'belongs to a user' do
    expect(picture).to respond_to(:user)
  end

  it 'is invalid without a caption' do
    picture.summary = nil
    expect(picture).not_to be_valid
  end

  it 'is invalid without a user' do
    picture.user_id = nil
    expect(picture).not_to be_valid
  end

end
