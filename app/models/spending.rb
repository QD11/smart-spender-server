class Spending < ActiveRecord::Base
   belongs_to :user
   belongs_to :category

   def convert_to_category_hash
      data = {
         amount: self.amount,
         category: self.category.description,
         date: self.date,
         description: self.description,
         id: self.id
      }
   end

   
end