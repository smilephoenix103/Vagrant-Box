class UsersController < ApplicationController
  def new
  end

  def create
    if User.where(user_params).count > 0
      user = User.where(user_params).first
      session[:user_id] = user.id
      puts session[:user_id]
      flash[:messages] = ["User Logged In"]
      redirect_to "/messages"
    else
      user = User.create(user_params)
      if user.errors.any?
        flash[:messages] = user.errors.full_messages
        redirect_back(fallback_location: root_path)
      else
        session[:user_id] = user.id
        flash[:messages] = ["User Created"]
        redirect_to "/messages"
      end
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
