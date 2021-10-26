class SpendingController < ApplicationController
    set :default_content_type, 'application/json'

    get '/spending/:user_id' do
        user = User.find(params[:user_id]) #Takes in id number to find user
        data = user.renders_user_spendings
        data.to_json
    end

end