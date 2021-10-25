class CreateSpendings < ActiveRecord::Migration[6.1]
  def change
    create_table :spendings do |t|
      t.string :description
      t.float :amount
      t.integer :user_id
      t.integer :month_id
      t.integer :category_id
    end
  end
end
