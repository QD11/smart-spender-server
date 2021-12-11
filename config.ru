require_relative "./config/environment"
require './server'

# disable buffering for Heroku Logplex
$stdout.sync = true

run Sinatra::Application  

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

# Our application
run ApplicationController
use UserController
use CategoryController
use SpendingController
use BudgetPlanController