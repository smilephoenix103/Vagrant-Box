require 'rails_helper'
feature 'User Settings features ' do
  before do
    @user = create(:user)
    log_in
  end
  feature "User Settings Dashboard" do
    before(:each) do 
      visit "/users/#{@user.id}/edit"
    end
    scenario "visit users edit page" do
      expect(page).to have_field('register_email')
      expect(page).to have_field('first_name')
      expect(page).to have_field('last_name')
    end
    scenario "inputs filled out correctly" do 
      expect(find_field('first_name').value).to eq(@user.first_name)
      expect(find_field('last_name').value).to eq(@user.last_name)
      expect(find_field('register_email').value).to eq(@user.email)      
    end    
    scenario "incorrectly updates information" do
      fill_in 'first_name', with: 'Another'      
      fill_in 'last_name', with: 'Name'      
      fill_in 'register_email', with: 'incorrect email format'
      click_button 'update'
      expect(current_path).to eq("/users/#{@user.id}/edit")
      expect(page).to have_text("Email is invalid")      
    end    
    scenario "correctly updates information" do 
      fill_in 'first_name', with: 'Another'
      fill_in 'last_name', with: 'Name'
      fill_in 'register_email', with: 'correct@email.com'
      click_button 'update'
      expect(page).to have_text('Another Name')
    end
    scenario "destroys user and redirects to registration page" do
      click_link 'delete'
      expect(current_path).to eq('/')
    end
  end
end