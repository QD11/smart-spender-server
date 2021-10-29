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
            budgetPlan = Budget_plan.create(user_id: user.id, housing_percentage: 12.5, transport_percentage: 12.5, food_percentage: 12.5, utility_percentage: 12.5, insurance_percentage: 12.5, emergency_percentage: 12.5, discretionary_percentage: 12.5, other_percentage: 12.5, balance: 1000)
            return user.to_json
        end
    end
end