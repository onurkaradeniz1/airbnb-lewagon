# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding the database"



100.times do
  flat = Flat.new(
    price_per_day: rand(50..300),
    address: Faker::Address.city,
    pictures: "hello",
    description: Faker::Lorem.sentence,
    capacity: rand(2..6),
    availability:
  )

  flat.user.id = 1
  flat.save
  puts "created flat"
end

puts "Completed!"
