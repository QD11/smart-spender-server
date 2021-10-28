class RemoveTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :months
    drop_table :years

  end
end
