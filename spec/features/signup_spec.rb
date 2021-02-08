require 'rails_helper'

RSpec.describe 'signing up a user' do

  it 'signs a user up' do
    visit root_path
    click_link 'Sign Up'
    expect(current_path).to eq(new_user_registration_path)
    fill_in 'Name', with: 'Drew'
    fill_in 'Username', with: 'dhund90'
    fill_in 'Email', with: 'email@website.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    expect { click_button 'Sign up' }.to change { User.count }.by(1).and change { Dashboard.count }.by(1)
    expect(current_path).to eq(root_path)
  end
end
