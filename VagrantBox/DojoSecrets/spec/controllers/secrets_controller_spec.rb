require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @user2 = create(:user, first_name: "Sean", last_name: "Combs", email: "pdiddy@gmail.com")
    @secret = create(:secret, user: @user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
        get :index
        expect(response).to redirect_to('/')
    end
    it "cannot access create" do
        post :create
        expect(response).to redirect_to('/')
    end
    it "cannot access destroy" do
        delete :destroy, params: { id: @secret.id}
    end
  end
  context "when signed in as the wrong user" do
    before do
      session[:user_id] = @user2.id
    end
    it "cannot destroy another user's secret" do
      delete :destroy, params: { id: @secret.id }
      expect(response).to redirect_to("/users/#{@user2.id}")
    end
  end
end