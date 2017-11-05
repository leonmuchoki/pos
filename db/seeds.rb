unless User.exists?(email: "admin@pos.com")
User.create!(email: "admin@pos.com", password: "password", admin: true
)
end

unless User.exists?(email: "staff@pos.com")
User.create!(email: "staff@pos.com", password: "password")
end

unless RestaurantTable.exists?(table_no: 1)
RestaurantTable.create!(table_no: 1, accomodates: 4)
end