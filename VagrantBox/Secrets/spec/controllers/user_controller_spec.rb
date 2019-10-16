require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    before do
        @user = create(:user)
        @user2 = create(:user, name: "Sean Combs", email: "pdiddy@gmail.com")
    end
    context "when not logged in" do
        before do
            session[:user_id] = nil
        end
        it "cannot access show" do 
            get :show, params: { id: @user.id }
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot access edit" do
            get :edit, params: { id: @user.id }
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot access update" do
            patch :update, params: { id: @user.id }
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot access destroy" do
            delete :destroy, params: { id: @user.id }
            expect(response).to redirect_to("/sessions/new")
        end
    end
    context "when signed in as the wrong user" do
        before do
            session[:user_id] = @user.id
        end
        it "cannot access profile page another user" do
            get :show, params: { id: @user2.id }
            expect(response).to redirect_to("/users/#{@user.id}")
        end
        it "cannot access the edit page of another user" do
            get :edit, params: { id: @user2.id }
            expect(response).to redirect_to("/users/#{@user.id}")
        end
        it "cannot update another user" do
            patch :update, params:{ id: @user2.id }
            expect(response).to redirect_to("/users/#{@user.id}")
        end
        it "cannot destroy another user" do
            delete :destroy, params: { id: @user2.id }
            expect(response).to redirect_to("/users/#{@user.id}")
        end
    end
end