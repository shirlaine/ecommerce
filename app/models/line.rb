class Line < ApplicationRecord

  belongs_to :product

  validates :price, presence: true
  validates :quantity, presence: true

end
