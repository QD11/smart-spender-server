class DropMonths < ActiveRecord::Migration[6.1]
  def change
    drop_table :months
    drop_table :years
    remove_column :spendings, :month_id
  end
end
