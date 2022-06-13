class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :user

  # validates :name, presence: true, uniqueness: true
end
