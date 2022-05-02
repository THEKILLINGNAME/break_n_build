class Product < ApplicationRecord
  belongs_to :brand

  validates :title, presence: true
  validates :price, presence: true
end
