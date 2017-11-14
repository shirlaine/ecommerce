class Order < ApplicationRecord
  belongs_to :user
  belongs_to :line, through: :cart_items  

end
