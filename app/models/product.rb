class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :drill_stat, optional: true
  belongs_to :screwdriver_stat, optional: true
  belongs_to :perforator_stat, optional: true
  belongs_to :screwdriver_bit_stat, optional: true
  belongs_to :perforator_bit_stat, optional: true
  belongs_to :charger_stat, optional: true

  validates :title, presence: true
  validates :price, presence: true

  include ImageUploader::Attachment(:image)

  enum category: {
    drills: "drills",
    screwdrivers: "screwdrivers",
    chargers: "chargers",
    perforators: "perforators",
    screwdriver_bits: "screwdriver_bits",
    perforator_bits: "perforator_bits"
  }
  validates :category, inclusion: { in: categories.keys }, presence: true

  validates :drill_stat, presence: true, uniqueness: true, if: -> { category == "drills" }
  validates :drill_stat, absence: true, if: -> { category != "drills" }

  validates :screwdriver_stat, presence: true, uniqueness: true, if: -> { category == "screwdrivers" }
  validates :screwdriver_stat, absence: true, if: -> { category != "screwdrivers" }

  validates :perforator_stat, presence: true, uniqueness: true, if: -> { category == "perforators" }
  validates :perforator_stat, absence: true, if: -> { category != "perforators" }

  validates :screwdriver_bit_stat, presence: true, uniqueness: true, if: -> { category == "screwdriver_bits" }
  validates :screwdriver_bit_stat, absence: true, if: -> { category != "screwdriver_bits" }

  validates :perforator_bit_stat, presence: true, uniqueness: true, if: -> { category == "perforator_bits" }
  validates :perforator_bit_stat, absence: true, if: -> { category != "perforator_bits" }

  validates :charger_stat, presence: true, uniqueness: true, if: -> { category == "chargers" }
  validates :charger_stat, absence: true, if: -> { category != "chargers" }
end
