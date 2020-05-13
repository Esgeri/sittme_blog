require 'rails_helper'

feature 'User sign out', %q{
  In order to be able to sign out session
  As an authenticated user
  I want to be able to sign out
} do

  given(:user) { create(:user) }

  scenario 'Registered user try to sign out' do
    sign_in(user)

    expect(page).to have_link 'Sign out'
    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
    expect(current_path).to eq(root_path)
    expect(page).to have_link 'Sign in'
  end

  scenario 'Non-registered user try to sign out' do
    visit root_path

    expect(page).to_not have_content 'Sign out'
  end
end
