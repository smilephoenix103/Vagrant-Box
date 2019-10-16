class SecretsController < ApplicationController
  before_action :require_correct_user, only: [:destroy]
  def index
    @secrets = Secret.all
  end

  def create
    secret = Secret.create(secret_params)
    if secret.errors.any?
      flash[:messages] = secret.errors.full_messages
      redirect_to "/users/#{current_user.id}"
    else
      flash[:messages] = ["New Secret Created"]
      redirect_to "/users/#{current_user.id}"
    end 
  end

  def destroy
    Secret.find(params[:id]).destroy
    redirect_to "/users/#{current_user.id}"
  end
  
  private
  def secret_params
    params.require(:secret).permit(:content).merge(user: current_user)
  end

  def require_correct_user
    if current_user != Secret.find(params[:id]).user
      redirect_to ("/users/#{session[:user_id]}")
    end
  end
end
