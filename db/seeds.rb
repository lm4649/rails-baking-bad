# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

addresses = [
  '1 Chome-1-5 Meguro',
  '3 Chome-9-1 Meguro',
  '4 Chome-3-14 Kamiosaki',
  'Meguro, 3 Chome−4−8',
  '1 Chome-7-8 Shimomeguro',
  '2 Chome-13-27 Meguro',
  '3 Chome-10-13 Meguro',
  '2 Chome-2-11 Shimomeguro',
  'Shimomeguro, 5 Chome−18−21',
  '1 Chome-8-1 Shimomeguro',
  '1 Chome-5-19 Shimomeguro',
  '2 Chome-17-2 Kamiosaki',
  'Kamiosaki, 2 Chome−16−9',
  'Kamiosaki, 2 Chome−１６−9',
  '1 Chome-3-17 Meguro',
  '1 Chome-7-6 Nakacho',
  '1 Chome-3-1 Shimomeguro',
  '4 Chome-2-1 Kamiosaki',
  '3 Chome-7-32-103 Shimomeguro',
  '2 Chome-7-14 Nakameguro'
]

breads = [ 'anpan', 'bagel', 'baguette', 'beer bread', 'chapati', 'crumpet', 'english muffin', 'foccacia', 'pandesal', 'sourdough bread']
prices = [100, 300, 500, 1000, 1500, 2000, 3000, 4000, 5000, 9000 ]

puts "destroy users and bakeries breads and orders"
Bakery.destroy_all
User.destroy_all
Order.destroy_all

puts "creating users, bakeries and breads"

10.times do
  user =  User.create!(  name: Faker::Name.unique.name,
                         email: Faker::Internet.unique.email,
                         password: "bakingbad1234"
                         )
  bakery = Bakery.new(
    name: Faker::Restaurant.unique.name,
    # description: Faker::Restaurant.description,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    # address: Faker::Address.street_address,
    address: addresses.sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  addresses.delete(bakery.address)
  bakery.user = user
  bakery.save!
  5.times do
    bread = Bread.new( name: breads.sample,
                       price: prices.sample,
                       min_quantity: (1..9).to_a.sample,
                       max_quantity: (10..99).to_a.sample,
                       )
    bread.bakery = bakery
    bread.save!
  end

end

puts "create customer orders"

5.times do


end

puts "#{User.count} users created"
puts "#{Bakery.count} bakeries created"
puts "#{Bread.count} breads created"
