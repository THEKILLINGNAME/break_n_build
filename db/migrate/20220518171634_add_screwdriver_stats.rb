class AddScrewdriverStats < ActiveRecord::Migration[7.0]
  def change
    create_table :screwdriver_stats do |t|
      t.string :power_type
      t.string :power
      t.string :rounds_per_min

      t.timestamps
    end
    change_table(:products) do |t|
      t.belongs_to :screwdriver_stat, foreign_key: true
    end
  end
end
