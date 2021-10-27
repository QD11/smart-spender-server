class SpendingController < ApplicationController
    set :default_content_type, 'application/json'

    get '/spending/:user_id' do
        user = User.find(params[:user_id]) #Takes in id number to find user
        data = user.renders_user_spendings
        data.to_json
    end

    post '/spending/:user_id' do
        spending = Spending.create(description: params[:amount], amount: params[:amount], user: params[:user_id], month: params[:month_id], date: params[:date], category_id: params[:category_id] )
        spending.to_json
    end

    patch '/spending/:id/edit'do
        spending = Spending.find(params[:id])
        spending.update(amount: params[:amount])
        spneding.to_json
    end

    delete '/spending/:id' do
        spending = Spending.find(params[:id])
        spending.destroy
    end

end