class AddAdminBoolToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :bool, null: false, default: false
  end
end
