class CreateMonths < ActiveRecord::Migration[6.1]
  def change
    create_table :months do |t|
      t.string :month
      t.integer :year_id
    end
  end
end
