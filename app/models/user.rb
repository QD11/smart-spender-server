class User < ActiveRecord::Base 
    has_many :spendings    
    has_many :categories, through: :spendings
    has_many :months, through: :spendings

    # Bcrypt function that saves the password safely
    # INSTANCE.authenticate(password) to check if its true
    has_secure_password 

    def renders_user_spendings
        user_specific_spendings = Spending.where(user_id: self.id)
        data = user_specific_spendings.map do |spending|
            {
                description: spending.description,
                amount: spending.amount,
                id: spending.id,
                date: spending.date,
                category: spending.category.description
            }
        end
    end

end