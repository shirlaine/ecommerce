class CartsController < ApplicationController

  before_action :set_cart_user, only: [:add, :remove, :show]

  def show
    if current_user
      # @products = current_user.cart_items
      @cart_items = current_user.cart_items

    else
      #session_cart_id = session_cart
      #@products = Line.find(session_cart_id)
    end

      @presenter = Presenters::CartPresenter.new(@cart_items)
  end

  def add
    if current_user
      @cart_item = CartItem.create(user_id: current_user.id, line_id: params[:line_id], quantity: 1)
      @cart_item.save

    else
      session_cart << params[:line_id].to_i
    end

    flash[:notice] = 'Item has been added to cart'
    redirect_to root_path

  end

  def remove
    if current_user
      @cart_items = CartItem.where("line_id = #{params[:line_id]}")
      @cart_items.each(&:destroy)
      # @cart_item = CartItem.find_by(line_id: params[:line_id]).destroy
    else
      session_cart.delete_at(session_cart.find_index(params[:line_id].to_i))
    end
    flash[:alert] = 'Item has been deleted from cart'
    redirect_to cart_path
  end

end
