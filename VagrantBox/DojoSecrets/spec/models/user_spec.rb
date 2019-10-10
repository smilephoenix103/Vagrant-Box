require 'rails_helper'

RSpec.describe User, type: :model do
  context  "with valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
    it "automatically encrypts the password into the password_digest attribute" do
      expect(build(:user).password_digest.present?).to eq(true)
    end
    it "saves email as lowercase" do
      expect(create(:user, email: 'EMAIL@EMAIL.COM').email).to eq('email@email.com')
    end
  end
  context "with invalid attributes should not save if" do
    it "first_name is blank" do
      expect(build(:user, first_name: '')).to be_invalid
    end
    it "last_name is blank" do
      expect(build(:user, last_name: '')).to be_invalid
    end
    it "email id blank" do
      expect(build(:user, email: '')).to be_invalid
    end
    it "email format is wrong" do
      expect(build(:user, email: '@bademail')).to be_invalid
    end
    it "email is not unique" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it "password is blank" do
      expect(build(:user, password: '')).to be_invalid
    end
    it "password does not match password_confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
end
