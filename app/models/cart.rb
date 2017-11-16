class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items

  def total_sum
    cart_items.to_a.sum(&total_price)
  end

end
