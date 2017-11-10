class Product < ApplicationRecord

  has_many :lines, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

end
