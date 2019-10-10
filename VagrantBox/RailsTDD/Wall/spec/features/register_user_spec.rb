require 'rails_helper'
feature "create user" do
  before(:each)do
    visit users_new_path
  end

  scenario "successfully creates a new user" do
    fill_in "username", with: "Kevin"
    click_button "submit"
    expect(page).to have_current_path(messages_path)
    expect(page).to have_content("Welcome Kevin")
  end

  scenario "user not created - blank username" do
    fill_in "username", with: ""
    click_button "submit"
    expect(page).to have_current_path(users_new_path)
    expect(page).to have_content("Username can't be blank")
  end

  scenario "user not created - username less than 5 characters" do
    fill_in "username", with: "bob"
    click_button "submit"
    expect(page).to have_current_path(users_new_path)
    expect(page).to have_content("Username is too short")
  end
end
