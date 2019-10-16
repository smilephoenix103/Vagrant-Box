class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:messages] = ["Invalid Email/Password Combination"]
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
