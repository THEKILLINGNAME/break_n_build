class PerforatorBitStat < ApplicationRecord
  has_one :product, dependent: :destroy
end
