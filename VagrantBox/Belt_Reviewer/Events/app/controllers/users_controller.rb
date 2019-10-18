class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  before_action :require_correct_user, except: [:create]

  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:messages] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New User Created"]
      session[:user_id] = user.id
      redirect_to "/events"
    end
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:messages] = ["User Updated"]
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    reset_session
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end

  def require_correct_user
    if current_user != User.find(params[:id])
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
