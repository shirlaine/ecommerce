class Line < ApplicationRecord

  belongs_to :product

  validates :price, presence: true
  validates :quantity, presence: true

  enum size: {
    '250ml': 0,
    '375ml': 1,
    '500ml': 2
  }

end