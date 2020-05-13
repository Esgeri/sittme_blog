require 'rails_helper'

feature 'User sign up', %q{
  In order to be able to sign up
  As an non-authenticated user
  I want to be able to sign up
} do

  scenario 'Non-registered user try to sign up' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Username', with: 'TestUser'
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(current_path).to eq(root_path)
    expect(page).to have_link 'Sign out'
  end

  given(:user) { create(:user) }

  scenario 'Registered user try to sign up' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'

    expect(page).to have_content 'error prohibited this user from being saved'
  end
end
