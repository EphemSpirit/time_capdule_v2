require 'rails_helper'

describe 'logging in', type: :feature do

  let(:user) { create(:user) }

  it 'signs a user in' do
    visit new_user_session_path
    expect(page).to have_link("Sign In", href: new_user_session_path)
    expect(page).not_to have_link("Sign Out")

    #log a user in
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    #check that the nav links change
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully')
    expect(page).to have_content("New Project")
    expect(page).to have_link("Sign Out", href: destroy_user_session_path)
  end
end
