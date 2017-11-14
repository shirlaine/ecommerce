class Product < ApplicationRecord

  has_many :lines, dependent: :destroy
  has_many :cart_items
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  accepts_nested_attributes_for :lines

end
