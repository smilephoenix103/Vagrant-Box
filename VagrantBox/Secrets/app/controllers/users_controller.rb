class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_correct_user, except: [:new, :create]

  def new
  end

  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:messages] = user.errors.full_messages
      redirect_to '/users/new'
    else
      flash[:messages] = ["New User Created"]
      session[:user_id] = user.id
      redirect_to '/sessions/new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:messages] = ["User Updated"]
      redirect_to "/users/#{user.id}"
    else
      flash[:messages] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    reset_session
    redirect_to "/users/new"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_correct_user
    if User.exists?(params[:id])
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
