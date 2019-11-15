require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #instructor" do
    it "returns http success" do
      get :instructor
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #student" do
    it "returns http success" do
      get :student
      expect(response).to have_http_status(:success)
    end
  end

end
