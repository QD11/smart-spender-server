class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :spendings, :month_id
  end
end
