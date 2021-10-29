class Month < ActiveRecord::Base 
    belongs_to :years
    has_many :spendings
    has_many :users, through: :spendings

end