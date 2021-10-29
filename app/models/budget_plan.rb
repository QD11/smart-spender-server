class BudgetPlan < ActiveRecord::Base 
    belongs_to :user

    require "date"

    def add_all_money_by_category
        userID = self.user_id 
        user_specific_spendings = Spending.where(user_id: userID).where("cast(strftime('%m', date) as int) = ?", Date.today.strftime("%m").to_i)
        if user_specific_spendings.empty?
            return [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        end
        categories_id = [1,2,3,4,5,6,7,8]
        array = categories_id.map do |i|
            category_spending = user_specific_spendings.where(category_id: i)
            if !category_spending.empty? #if not empty
                category_spending.sum(:amount)
            else
                0.0
            end
        end
    end

    def category_percentage
        category_spendings = self.add_all_money_by_category
        total_spent_so_far = category_spendings.reduce(0, :+)
        if total_spent_so_far == 0.0 or !total_spent_so_far or !category_spendings or category_spendings == [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
            return [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        end
        array = category_spendings.map do |money|
            if money == 0.0
                0.0
            else
                percent = (money.to_f/total_spent_so_far.to_f*100).round(2)
            end
        end
    end

    def planned_money
        if !self.balance or self.balance == 0.0
            return [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        end
        keys = [
            "housing_percentage",
            "transport_percentage",
            "food_percentage",
            "utility_percentage",
            "insurance_percentage",
            "emergency_percentage",
            "discretionary_percentage",
            "other_percentage"
        ]
        values = keys.map{|key| self[key]}
        array = values.map do |value|
            (self.balance.to_f * value.to_f/100).round(2)
        end
    end

    def renders_user_plans
        # budgetplan = BudgetPlan.find_by(user_id: self.id)
        keys = [
            "housing_percentage",
            "transport_percentage",
            "food_percentage",
            "utility_percentage",
            "insurance_percentage",
            "emergency_percentage",
            "discretionary_percentage",
            "other_percentage"
        ]
        values = keys.map{|key| self[key]}
        categories = Category.pluck("description")
        planned_money = self.planned_money
        actual_money = self.add_all_money_by_category
        actual_perce = self.category_percentage
        data =  categories.map.with_index do |category, index|
            {
                category: category,
                plannedPercentage: values[index],
                plannedMoney: planned_money[index],
                actualDollar: actual_money[index],
                actualPercentage: actual_perce[index],
            }
        end
        
    end
end