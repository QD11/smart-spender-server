class Category < ActiveRecord::Base 
    has_many :spendings    
    has_many :users, through: :spendings
    has_many :months, through: :spendings
    
end