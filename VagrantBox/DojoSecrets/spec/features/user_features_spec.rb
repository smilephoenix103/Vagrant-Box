require 'rails_helper'
feature 'User features ' do
  before do
    @user = create(:user)
  end
  feature "user sign-up" do
    before(:each) do
      visit "/"
    end
    scenario 'visits sign-up page' do
      expect(page).to have_field('first_name')
      expect(page).to have_field('last_name')
      expect(page).to have_field('register_email')
      expect(page).to have_field('register_password')
      expect(page).to have_field('password_confirmation')
    end
    scenario "with improper inputs, redirects back to sign in and shows validations" do
      click_button 'register'
      expect(current_path).to eq('/')
      expect(page).to have_text("can't be blank")
    end
    scenario "with proper inputs, create user and redirects to user show" do 
      fill_in 'first_name', with: 'curry'
      fill_in 'last_name', with: 'curry'
      fill_in 'register_email', with: 'curry@warriors.com'
      fill_in 'register_password', with:  'password'
      fill_in 'password_confirmation', with: 'password'
      click_button 'register'
      expect(page).to have_text("curry")
    end
  end
  feature "user dashboard" do 
    before do
      log_in
    end  
    scenario "displays user information" do 
      expect(page).to have_text("#{@user.first_name}")
      expect(page).to have_link('edit')
    end
  end
end