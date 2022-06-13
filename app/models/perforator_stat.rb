class PerforatorStat < ApplicationRecord
  has_one :product, dependent: :destroy
end
