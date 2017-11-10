class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to root_url
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    if
      @product.update_attributes(post_params)
      redirect_to root_url
    else
      render :edit
    end

  end



private
  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
