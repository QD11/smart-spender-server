class BudgetPlanController < ApplicationController
    set :default_content_type, 'application/json'

    get '/budgetplan/:user_id' do
        budget = BudgetPlan.find_by(user_id: params[:user_id]) #Takes in id number to find user
        data = budget.renders_user_plans
        data.to_json
    end

    get '/budgetplan/table/:user_id' do
        data = BudgetPlan.find_by(user_id: params[:user_id])
        data.to_json
    end

    patch '/budgetplan/:table_id' do
        budgetplan = BudgetPlan.find(params[:table_id])
        budgetplan.update(
            balance: params[:balance],
            housing_percentage: params[:housing_percentage],
            transport_percentage: params[:transport_percentage],
            food_percentage: params[:food_percentage],
            utility_percentage: params[:utility_percentage],
            insurance_percentage: params[:insurance_percentage],
            emergency_percentage: params[:emergency_percentage],
            discretionary_percentage: params[:discretionary_percentage],
            other_percentage: params[:other_percentage]
        )
        budgetplan.to_json
    end

    # patch '/budgetplan/update/:user_id' do 
    #     user = User.find(params[:user_id])
    #     user.update(balance: params[:balance])
    #     budgetplan = BudgetPlan.find_by(user_id: params[:user_id])
    #     budgetplan.update(
    #         housing_percentage: params[:housing_percentage],
    #         transport_percentage: params[:transport_percentage],
    #         food_percentage: params[:food_percentage],
    #         utility_percentage: params[:utility_percentage],
    #         insurance_percentage: params[:insurance_percentage],
    #         emergency_percentage: params[:emergency_percentage],
    #         discretionary_percentage: params[:discretionary_percentage],
    #         other_percentage: params[:other_percentage]
    #     )
    #     budgetplan.to_json
    # end
end