class ScrewdriverBitStat < ApplicationRecord
  has_one :product, dependent: :destroy
end
