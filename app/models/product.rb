class Product < ApplicationRecord

  has_many :lines, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :lines

end
