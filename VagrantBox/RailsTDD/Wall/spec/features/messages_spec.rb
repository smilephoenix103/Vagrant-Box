require 'rails_helper'
feature "create message" do
  before(:each) do
    visit root_path
    fill_in "username", with: "Kevin"
    click_button "submit"
  end

  scenario "message created successfully" do
    fill_in "message", with: "Example message"
    click_button "submit"
    expect(page).to have_current_path(messages_path)
    expect(page).to have_content("Example message")
  end

  scenario "message not created - message less than 10 characters" do
    fill_in "message", with: "Hey"
    click_button "submit"
    expect(page).to have_current_path(messages_path)
    expect(page).to have_content("Message is too short")
  end

  scenario "message not created - message field blank" do
    click_button "submit"
    expect(page).to have_current_path(messages_path)
    expect(page).to have_content("Message can't be blank")
  end
end
