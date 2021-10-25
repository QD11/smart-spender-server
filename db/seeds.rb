puts "🌱 Seeding spices..."
    User.create(full_name: "Adam J", email: "Adamj@fakedomain.com", password_digest: "12234", balance: 1000.43)

    Category.create(description: "Discretionary")
    Category.create(description: "Grocery")
    Category.create(description: "Other")


puts "✅ Done seeding!"
