class AddReceivingNewsFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :receiving_news, :bool, null: false, default: false
  end
end
