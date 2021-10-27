class CreateBudgetPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :budget_plans do |t|
      t.integer :user_id
      t.float :housing_percentage
      t.float :transport_percentage
      t.float :food_percentage
      t.float :utility_percentage
      t.float :insurance_percentage
      t.float :emergency_percentage
      t.float :discretionary_percentage
      t.float :other_percentage
    end
  end
end
