class ProductsController < ApplicationController
  def index
    puts "YAHAHAH"
    @products = Product.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    product = Product.create(product_params)
    if product.errors.any?
      flash[:errors] = product.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "New Product Added"
      redirect_to '/'
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show'
  end

  def edit
    @product = Product.find(params[:id])
    render 'edit'
  end

  def update
    product = Product.find(params[:id]).update(product_params)
    redirect_to "/products/#{params[:id]}"
  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :imgurl)
  end

end
