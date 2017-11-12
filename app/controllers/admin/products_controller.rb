class Admin::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.lines.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Your product has been created'
      redirect_to root_path
    else
      flash[:alert] = 'Your product has not been created'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Your product has been updated'
      redirect_to root_path
    else
      flash[:alert] = 'Your product has not been updated'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Your product has been deleted'
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, lines_attributes: [:size, :price, :quantity])
  end

end
