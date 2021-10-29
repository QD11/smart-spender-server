class User < ActiveRecord::Base 
    has_many :spendings    
    has_many :budget_plans
    has_many :categories, through: :spendings

    require "date"

    # Bcrypt function that saves the password safely
    # INSTANCE.authenticate(password) to check if its true
    has_secure_password 

    def renders_user_spendings
        user_specific_spendings = Spending.where(user_id: self.id).order(:date).reverse
        data = user_specific_spendings.map do |spending|
            {
                description: spending.description,
                amount: spending.amount,
                id: spending.id,
                date: spending.date,
                category: spending.category.description,
                # category_id: spending.category_id,
                # month_id: spending.month_id,
                # user_id: spending.user_id
            }
        end
    end

    def get_spendings_last_six_months
        spendings_user = Spending.where(user_id: self.id)
        month_year = []
        6.times do |i|
            month_year.push( {
                month: (Date.today<<(5-i)).strftime("%m").to_i,
                year: (Date.today<<(5-i)).strftime("%Y").to_i
            })
        end
        spending_by_month = month_year.map do |element|
            Spending.where("cast(strftime('%m', date) as int) = ?", element[:month]).where("cast(strftime('%Y', date) as int) = ?", element[:year]).sum(:amount)
        end
        month_year_spending = []
        6.times do |i|
            month_year_spending.push( {
                month: month_year[i][:month],
                year: month_year[i][:year],
                spending: spending_by_month[i]
            })
        end
        month_year_spending
    end

    def get_latest_spendings
        spendings_user = Spending.where(user_id: self.id).order(:date).reverse.first(3)
        data = spendings_user.map do |spending|
            {
                description: spending.description,
                amount: spending.amount,
                category: spending.category.description,
                date: spending.date,
            }
        end
    end

    def get_ordered_spendings
        spendings_user = Spending.where(user_id: self.id).order(:date).reverse
        data = spendings_user.map do |spending|
            {
                description: spending.description,
                amount: spending.amount,
                date: spending.date,
                category: spending.category.description,
            }
        end
    end

end