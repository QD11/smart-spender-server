class Spending < ActiveRecord::Base 
   belongs_to :user
   belongs_to :month
   belongs_to :category

end