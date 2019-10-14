class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:messages] = user.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New User Created"]
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    end
  end

  def show
    @user = User.find(params[:id])
    @secrets = Secret.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    User.find(params[:id]).delete
    reset_session
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
