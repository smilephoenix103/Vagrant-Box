require 'rails_helper'
RSpec.describe LikesController, type: :controller do 
    before do 
        @user = create(:user)
        @user2 = create(:user, first_name: "Paul", last_name: "Riser", email: "priser@nbc.com")
        @secret = create(:secret, user: @user)
        @like = create(:like, secret: @secret, user: @user)
    end
    context "when not logged in " do 
        before do 
        session[:user_id] = nil
        end
        it "cannot create a like" do
            post :create
            expect(response).to redirect_to('/')
        end
        it "cannot destroy a like" do
            delete :destroy, params: { id: @like.id }
            expect(response).to redirect_to('/')
        end
    end
    context "when signed in as the wrong user" do
        before do
            session[:user_id] = @user2.id
        end
        it "shouldn't be able to destroy a like" do
            delete :destroy, params: { id: @like.id }
            expect(response).to redirect_to("/users/#{@user2.id}")
        end
    end
end