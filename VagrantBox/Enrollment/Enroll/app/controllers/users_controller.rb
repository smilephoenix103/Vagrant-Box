class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:messages] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New user added"]
      session[:user_id] = user.id
      redirect_to '/users'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(user_params)
    redirect_to '/users'
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      user.destroy
      flash[:messages] = ["User deleted"]
      redirect_to '/users'
    else
      flash[:messages] = ["Cannot delete another user"]  
      redirect_to '/users'
    end
  end

  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end  
end
