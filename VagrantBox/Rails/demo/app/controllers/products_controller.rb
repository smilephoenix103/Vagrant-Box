class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    @product = Product.create()
    redirect_to 'index'
  end

  def show
    @product = Product.find(params[:id])
    render 'show'
  end

  def edit
    @product = Product.find(params[:id])
    render 'edit'
  end

  def udpate
    @product = Product.update()
    redirect_to 'index'
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to 'index'
  end

end
