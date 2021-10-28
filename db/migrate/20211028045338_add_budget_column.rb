class AddBudgetColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :budget_plans, :balance, :float
  end
end
