class SpendingController < ApplicationController
    set :default_content_type, 'application/json'

    get '/spending/:user_id' do
        user = User.find(params[:user_id]) #Takes in id number to find user
        data = user.renders_user_spendings
        data.to_json
    end

    post '/spending/:spending_id' do
        spending = Spending.create(description: params[:description], amount: params[:amount], user_id: params[:user_id], date: params[:date], category_id: params[:category_id]) 
        user1 = spending.user
        data = user1.get_ordered_spendings
        data.to_json
    end

    patch '/spending/:spending_id/edit' do
        spending = Spending.find(params[:spending_id])
        spending.update(amount: params[:amount], description: params[:description], date: params[:date], category_id: params[:category_id])
        category_as_hash = spending.convert_to_category_hash
        category_as_hash.to_json
    end

    delete '/spending/:spending_id' do
        spending = Spending.find(params[:spending_id])
        spending.destroy
    end

    get '/spending/sixmonths/:user_id' do
        user = User.find(params[:user_id])
        data = user.get_spendings_last_six_months
        data.to_json
    end

    get '/spending/recent/:user_id' do
        user = User.find(params[:user_id])
        data = user.get_latest_spendings
        data.to_json
    end

    get '/spending/currentmonthcategories/:user_id' do
        user = BudgetPlan.find_by(user_id: params[:user_id])
        data = user.add_all_money_by_category
        data.to_json
    end

end