puts "🌱 Seeding spices..."
    User.create(full_name: "Adam J", email: "Adamj@fakedomain.com", password_digest: "12234", balance: 1000.43)

    Category.create(description: "Discretionary")
    Category.create(description: "Grocery")
    Category.create(description: "Other")

    Year.create(year: 2021)


    Spending.create(description: "pizza", amount: 100.43, user_id: 2, month_id: 9, category_id: 2, date: "09/24/2021")

    Month.create(month: "January", year_id: 1)
    Month.create(month: "February", year_id: 1)
    Month.create(month: "March", year_id: 1)
    Month.create(month: "April", year_id: 1)
    Month.create(month: "May", year_id: 1)
    Month.create(month: "June", year_id: 1)
    Month.create(month: "July", year_id: 1)
    Month.create(month: "August", year_id: 1)
    Month.create(month: "September", year_id: 1)
    Month.create(month: "October", year_id: 1)
    Month.create(month: "November", year_id: 1)
    Month.create(month: "December", year_id: 1)

puts "✅ Done seeding!"
