class DrillStat < ApplicationRecord
  has_one :product, dependent: :destroy
end
