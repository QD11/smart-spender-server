class User < ActiveRecord::Base 
    has_many :spendings    
    has_many :categories, through: :spendings
    has_many :months, through: :spendings

    # Bcrypt function that saves the password safely
    # INSTANCE.authenticate(password) to check if its true
    has_secure_password 

end