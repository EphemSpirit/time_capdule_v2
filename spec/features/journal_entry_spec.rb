require 'rails_helper'

RSpec.describe 'posting a journal entry' do

  let(:user) { create(:user) }

  it 'posts a journal entry' do
    #log a user in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    #write an entry
    visit new_entry_path
    expect(page).to have_content('Make a New Journal Entry')
    fill_in 'Title', with: 'Test post'
    fill_in 'Body', with: 'this is a test post'
    expect { click_button 'Post Entry' }.to change{ Journal.count }.by(1)
  end
end
