# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

breads = [ 'anpan', 'bagel', 'baguette', 'beer bread', 'chapati', 'crumpet', 'english muffin', 'foccacia', 'pandesal', 'sourdough bread']
prices = [100, 300, 500, 1000, 1500, 2000, 3000, 4000, 5000, 10000 ]

puts "destroy users & bakeries) (&breads"
Bakery.destroy_all
User.destroy_all

puts "creating users, bakeries é breads"

3.times do
user =  User.create!(  name: Faker::Name.unique.name,
                  email: Faker::Internet.unique.email,
                  password: "bakingbad1234"
                )
bakery = Bakery.new(
  name: Faker::Restaurant.unique.name,
  description: Faker::Restaurant.description,
  address: Faker::Address.street_address,
  phone_number: Faker::PhoneNumber.cell_phone
)

bakery.user = user
bakery.save!
  5.times do

    bread = Bread.new( name: breads.sample,
               price: prices.sample,
               min_quantity: (1..9).to_a.sample,
               max_quantity: (10..100).to_a.sample,
              )
    bread.bakery = bakery
    bread.save!
  end


end

puts "#{User.count} users created"
puts "#{Bakery.count} bakeries created"
puts "#{Bread.count} breads created"



