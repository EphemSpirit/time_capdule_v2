require 'rails_helper'

RSpec.describe 'adding tags to a journal' do

  let(:user) { create(:user) }
  let(:entry) { Journal.create(title: "test post", body: "test post body", author: user) }

  it 'adds tags to a journal entry' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_entry_path
    expect(page).to have_content('Make a New Journal Entry')
    fill_in 'Title', with: 'Test post'
    fill_in 'Body', with: 'testing tags'
    click_button 'Post Entry'

    #add tags
    expect(page).to have_content('Tags:')
    fill_in 'Name', with: 'example, tagging'
    expect { click_button('Add Tags') }.to change{ Tag.count }.by(1)
    # expect(current_path).to eq(entry_path(entry.id))
    expect(entry.tags).not_to be_nil
  end
end
