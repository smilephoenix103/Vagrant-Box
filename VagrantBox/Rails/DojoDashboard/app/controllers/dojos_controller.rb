class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    dojo = Dojo.create(dojo_params)
    if dojo.errors.any?
      flash[:errors] = dojo.errors.full_messages
      redirect_back
    else
      flash[:success] = "New Dojo Added"
      redirect_to '/'
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
    render 'show'
  end

  def edit
    @dojo = Dojo.find(params[:id])
    render 'edit'
  end

  def update
    Dojo.find(params[:id]).update(dojo_params)
    redirect_to "/dojos/#{params[:id]}"
  end

  def destroy
    Dojo.find(params[:id]).delete
    redirect_to '/'
  end

  private
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
  
end
