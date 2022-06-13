class CreateOrdersAndOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user

      t.timestamps
    end
    create_table :order_products do |t|
      t.belongs_to :product
      t.integer :amount
      t.belongs_to :order

      t.timestamps
    end
  end
end
