class CartsController < ApplicationController

  before_action :set_cart_user, only: [:add, :remove, :show]

  def show
    if current_user
      @products = current_user.lines
    else
      # setting a session cart to session_cart_id
      session_cart_id = session_cart
      @products = Line.find(session_cart_id)
    end
  end

  def add
    if current_user
      @cart_item = CartItem.create(user_id: current_user.id, line_id: params[:line_id])
    else
      session_cart << params[:line_id].to_i
    end
    flash[:notice] = 'Item has been added to cart'
    redirect_to cart_path
  end

  def remove
    if current_user
      @cart_item = CartItem.find_by(line_id: params[:line_id]).destroy
    else
      session_cart.delete_at(session_cart.find_index(params[:line_id].to_i))
    end
    flash[:alert] = 'Item has been deleted from cart'
    redirect_to cart_path
  end

end
