class Order < ApplicationRecord
  belongs_to :user
  has_many :lines, through: :cart_items

end
