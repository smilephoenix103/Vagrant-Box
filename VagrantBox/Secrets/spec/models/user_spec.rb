require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
    it "automatically encrypts password into password_digest" do
      expect(build(:user).password_digest.present?).to eq(true)
    end
    it "saves email as lowercase" do
      expect(create(:user, email: 'EMAIL@EMAIL.COM').email).to eq('email@email.com')
    end
  end
  context "with invalid attributes should not save if" do
    it "name is blank" do
      expect(build(:user, name: '')).to be_invalid
    end
    it "email is blank" do
      expect(build(:user, email: '')).to be_invalid
    end
    it 'invalid email format' do
      expect(build(:user, email: '@bademail')).to be_invalid
    end
    it 'email is not unique' do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it "password is blank" do
      expect(build(:user, password: '')).to be_invalid
    end
    it "password does not match password confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
  context "relationships" do
    before do
      @user = create(:user)
      @secret = create(:secret, content: 'secret 1', user: @user)
      @like = create(:like, secret: @secret, user: @user)
    end
    it "has secret" do
      expect(@user.secrets).to include(@secret)
    end
    it "has likes" do
      expect(@user.likes).to include(@like)
    end
    it "has secrets through likes table" do
      expect(@user.liked_secrets).to include(@secret)
    end
  end
end
