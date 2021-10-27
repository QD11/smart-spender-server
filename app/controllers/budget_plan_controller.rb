class BudgetPlanController < ApplicationController
    set :default_content_type, 'application/json'

    get '/budgetplan/:user_id' do
        user = User.find(params[:user_id]) #Takes in id number to find user
        data = user.renders_user_plans
        data.to_json
    end

end