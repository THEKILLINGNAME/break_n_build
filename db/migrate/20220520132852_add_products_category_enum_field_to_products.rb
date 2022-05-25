class AddProductsCategoryEnumFieldToProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :charger_stats do |t|
      t.string :capacity
      t.string :output_voltage
      t.string :type_of_charge

      t.timestamps
    end
    create_table :perforator_stats do |t|
      t.string :power
      t.string :rounds_per_min
      t.string :strokes_per_min
      t.string :catrtridge_type
      t.string :drilling_diameter

      t.timestamps
    end
    create_table :screwdriver_bit_stats do |t|
      t.string :length
      t.string :size
      t.string :shlitz_type

      t.timestamps
    end
    create_table :perforator_bit_stats do |t|
      t.string :diametr
      t.string :length
      t.string :cartridge_type

      t.timestamps
    end

    change_table(:products) do |t|
      t.belongs_to :charger_stat, foreign_key: true
      t.belongs_to :perforator_stat, foreign_key: true
      t.belongs_to :screwdriver_bit_stat, foreign_key: true
      t.belongs_to :perforator_bit_stat, foreign_key: true
    end
  end
end
