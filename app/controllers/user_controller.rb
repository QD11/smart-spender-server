class UserController < ApplicationController
    set :default_content_type, 'application/json'

    get "/user/:email" do
        user = User.find_by(email: params[:email])
        user.to_json
    end


end