class Category < ActiveRecord::Base 
    has_many :spendings    
    has_many :users, through: :spendings
    
end