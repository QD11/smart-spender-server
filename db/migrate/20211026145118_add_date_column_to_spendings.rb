class AddDateColumnToSpendings < ActiveRecord::Migration[6.1]
  def change
    add_column :spendings, :date, :date
  end
end
