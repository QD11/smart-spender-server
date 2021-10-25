class User < ActiveRecord::Base 
    has_many :spendings    
    has_many :categories, through: :spendings
    has_many :months, through: :spendings

end