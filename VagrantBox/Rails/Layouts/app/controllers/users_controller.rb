class UsersController < ApplicationController
  layout "two_column"
  
  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:errors] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "New User Created"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :favorite_language)
  end
end
