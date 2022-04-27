class Product < ApplicationRecord
  belongs_to :brand, optional: false

  validates :title, presence: true
  validates :price, presence: true
end
