require 'rails_helper'

RSpec.describe Journal, type: :model do

  let(:user) { create(:user) }
  let(:entry) { Journal.create(title: "Test", body: "test entry", author: user) }

  it 'is valid' do
    expect(entry).to be_valid
  end

  it 'belongs to a user' do
    expect(entry.author).to eq(user)
  end

  it 'responds to #author' do
    expect(entry).to respond_to(:author)
  end

  it 'has a title' do
    entry.title = nil
    expect(entry).to_not be_valid
  end

  it 'has a body' do
    entry.body = nil
    expect(entry).not_to be_valid
  end

  it 'responds to #tag_list' do
    expect(entry).to respond_to(:tag_list)
  end
end
