class Line < ApplicationRecord

  belongs_to :product
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :price, presence: true

  enum size: {
    '250ml': 0,
    '375ml': 1,
    '500ml': 2,
    'N.A': 3
  }

end
