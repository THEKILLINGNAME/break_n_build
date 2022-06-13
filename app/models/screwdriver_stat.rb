class ScrewdriverStat < ApplicationRecord
  has_one :product, dependent: :destroy
end
