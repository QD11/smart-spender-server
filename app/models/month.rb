class Month < ActiveRecord::Base 
    has_many :spendings    
    belongs_to :year
    
end