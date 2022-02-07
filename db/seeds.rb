# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding the database"

user1 = User.create(
  email: "george123@gmail.com",
  password: 123321
)

puts "created user"


100.times do
  number = 1
  flat = Flat.new(
    price_per_day: rand(50..300),
    address: Faker::Address.city,
    start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    capacity: rand(2..6)
  )
  flat.user = user1
  flat.save
  puts "created flat #{number}"
  number += 1
end

puts "Completed!"
