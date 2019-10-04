class UsersController < ApplicationController

  def create
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    redirect_to '/users'
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    render json: User.all
  end

  def new
  end

  def show
    render json: User.find(params[:id])
  end

  def total
    render json: {total: User.count}
  end
end
