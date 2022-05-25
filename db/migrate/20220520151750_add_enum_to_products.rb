class AddEnumToProducts < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def up
    create_enum :product_categories, %w[drills screwdrivers chargers perforators screwdriver_bits perforator_bits]
    change_table :products do |t|
      t.enum :category, enum_type: "product_categories", default: "drills", null: false
    end
  end
  def down
    remove_column :products, :category
    execute <<-SQL
      DROP TYPE product_categories;
    SQL
  end
end
