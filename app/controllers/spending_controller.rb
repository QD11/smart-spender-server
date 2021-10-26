class SpendingController < ApplicationController
    set :default_content_type, 'application/json'

    get '/spending/:user_id' do
        user = User.find(params[:user_id]) #Takes in id number to find user
        user_specific_spendings = Spending.where(user_id: params[:user_id])
        data = user_specific_spendings.map do |spending|
            {
                id: spending.id,
                description: spending.description,
                amount: spending.amount,
                user_id: spending.user_id,
                month_id: spending.month_id,
                category: spending.category.description,
                date: spending.date
            }
        end
        data.to_json
    end

end