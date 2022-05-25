class AddDrillStats < ActiveRecord::Migration[7.0]
  def change
    create_table :drill_stats do |t|
      t.string :power_type
      t.string :power
      t.string :capacity

      t.timestamps
    end
    change_table(:products) do |t|
      t.belongs_to :drill_stat, foreign_key: true
    end
  end
end
