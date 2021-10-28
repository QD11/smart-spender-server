class UserController < ApplicationController
    set :default_content_type, 'application/json'

    post "/login" do
        user = User.find_by(email: params[:email])
        password = user.authenticate(params[:password])
        if (user && password) 
            return user.to_json
        else
            return nil.to_json
        end
    end

    post "/signup" do
        if (User.find_by(email: params[:email]))
            return nil.to_json
        else
            user = User.create(full_name: params[:full_name], email: params[:email], password_digest: params[:password_digest])
            budgetPlan = Budget_plan.create(user_id: params[:used_id], housing_percentage: 0.125, transport_percentage: 0.125, food_percentage: 0.125, utility_percentage: 0.125, insurance_percentage: 0.125, emergency_percentage: 0.125, discretionary_percentage: 0.125, other_percentage: 0.125, balance: 1000)
            return user.to_json
        end
    end
end