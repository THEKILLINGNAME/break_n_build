class AddJsonbFieldToProducts < ActiveRecord::Migration[7.0]
  def change
    change_table(:products) do |t|
      t.jsonb "stats"
    end
  end
end
