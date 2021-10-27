class CategoryController < ApplicationController
    set :default_content_type, 'application/json'

    get '/category' do
        data= Category.all
        data.to_json
    end

end