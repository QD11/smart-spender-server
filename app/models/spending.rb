class Spending < ActiveRecord::Base 
   belongs_to :user
   belongs_to :month
   belongs_to :category

   def renders_user_spendings
      user_specific_spendings = Spending.where(user_id: self.id)
      data = user_specific_spendings.map do |spending|
         {
            **spending,
            category: spending.category.description
         }
      end
   end

end