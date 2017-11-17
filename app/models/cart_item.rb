class CartItem < ApplicationRecord

  belongs_to :user
  belongs_to :line

  def total_price
    price * quantity
  end


private

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :line_id, :quantity)
  end
end
