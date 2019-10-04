class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    redirect_to 'index'
  end

  def show
    render 'show'
  end

  def edit
    render 'edit'
  end

  def udpate
    redirect_to 'index'
  end

  def destroy
    redirect_to 'index'
  end

end
