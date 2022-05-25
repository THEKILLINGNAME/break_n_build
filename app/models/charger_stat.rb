class ChargerStat < ApplicationRecord
  has_one :product, dependent: :destroy

  # validates :name, presence: true, uniqueness: true
end
