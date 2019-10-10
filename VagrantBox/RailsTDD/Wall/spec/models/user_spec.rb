require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid attributes" do
    it "saves user" do
      expect(build(:user)).to be_valid
    end
  end
  
  context "with invalid attributes" do
    it "doesn't save if username is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    it "doesn't save if username is less than 5 characters" do
      expect(build(:user, username: "Bob")).to be_invalid
    end
    it "should have a unique username" do
    end
  end

end
