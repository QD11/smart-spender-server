class SpendingController < ApplicationController
    set :default_content_type, 'application/json'

    get '/spending/:user_id' do
        spendings = Spending.all
        spendings.to_json
    end

end