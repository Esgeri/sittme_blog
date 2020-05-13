require 'rails_helper'

feature 'User visit page', %q{
  In order to be able to visit pages
  As an user
  I want to be able to see pages
} do

  scenario 'User visit root page' do
    visit root_path

    expect(page).to have_content('Welcome to Blog')
    expect(page).to have_link('About')
    expect(current_path).to eq(root_path)
  end

  scenario 'User visit about page' do
    visit root_path

    expect(page).to have_link('About')
    click_on 'About'
    expect(page).to have_content('About Blog')
    expect(page).to have_link('Welcome page')
    expect(page).to have_css('.json_data')

    expect(current_path).to eq(about_path)
  end

  scenario 'User tries get json data about users' do
    visit about_path

    expect(page).to have_content('About Blog')
    expect(page).to have_link('Welcome page')
    expect(page).to have_css('.json_data')

    click_on 'Request!'

    expect(page.status_code).to eq(200)
    expect(page.body).not_to be_nil
    expect(current_path).to eq(json_data_path)
  end
end
