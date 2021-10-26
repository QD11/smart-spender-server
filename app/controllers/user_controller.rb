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
        # user.autheticate(params[:password])
    end


end