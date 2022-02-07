# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning up the database"

Flat.destroy_all
User.destroy_all

puts "creating users"

users = []

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::PhoneNumber.subscriber_number(length: 6)
  )
  users << user
  puts "created user with id: #{user.id}"
end

puts "creating flats"

50.times do
  flat = Flat.new(
    price_per_day: rand(50..300),
    address: Faker::Address.city,
    start_date: Faker::Date.between(from: '2022-01-01', to: '2022-01-20'),
    end_date: Faker::Date.between(from: '2014-01-21', to: '2014-02-10'),
    capacity: rand(2..6)
    )
  flat.user = users.sample
  flat.save
  puts "created flat with id: #{flat.id}"
end

puts "Done seeding, have fun coding!"
