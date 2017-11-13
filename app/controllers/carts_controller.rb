class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cart, only: [:add, :remove, :show]

  def show
    @products = current_user.lines
  end

  def add
    @cart_item = CartItem.create(user_id:current_user.id, line_id: params[:line_id])
    flash[:notice]='Item has been added to cart'
    redirect_to root_path
  end

  def remove
    @cart_item= CartItem.find_by(line_id: params[:line_id]).destroy
    flash[:alert]='Item has been deleted from cart'
    redirect_to cart_path(current_user.cart)
  end

end


