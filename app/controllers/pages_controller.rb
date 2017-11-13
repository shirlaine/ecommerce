class PagesController < ApplicationController

  def index
    @products = Product.all
    @cart_item = CartItem.new
  end

  def benefits
  end
end
