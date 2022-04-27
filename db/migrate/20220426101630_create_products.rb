class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :brand, null: false, foreign_key: true
      t.float :price, null: false
      t.boolean :stock, null: false, default: true

      t.timestamps
    end
  end
end
