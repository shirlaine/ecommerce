class CartItem < ApplicationRecord

  belongs_to :user
  belongs_to :line

  def total_price
    price * quantity
  end

  def show
    @cart_item = CartItem.find_by(cart_item_params)
  end


private

  def cart_item_params
    params.require

end
