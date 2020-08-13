# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

puts "destroy users and bakeries breads and orders"
Bakery.destroy_all
Bread.destroy_all
User.destroy_all
Order.destroy_all

# bakery data
addresses = [
  '9-chōme-7-4 Akasaka',
  '3-chōme-8-5 Azabujuban',
  '3-chōme-15-5 Shirokanedai',
  '1-chōme-8-14 Ebisu',
  '1-chōme-13-1 Mita',
  '5-chōme-24-1 Hiroo',
  '5-chōme-1-1 Kamimeguro',
  '3-chōme-14-3 Meguro',
  '3-chōme-1-1 Nakanobu',
  '1-chōme-7-6 Nakacho',

]

# breads
breads = [ 'anpan', 'bagel', 'baguette', 'beer bread', 'chapati', 'crumpet', 'english muffin', 'foccacia', 'pandesal', 'sourdough bread']
prices = [100, 300, 500, 1000, 1500, 2000, 3000, 4000, 5000, 9000 ]

puts "fetching bread names"

url = "https://www.bhf.org.uk/informationsupport/heart-matters-magazine/nutrition/cooking-skills/dough/a-to-z-of-breads"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('article > h2').each do |element|
  breads << element.text.strip.downcase
end

breads.uniq!

puts "creating users, bakeries and breads"

10.times do
  user =  User.create!(  name: Faker::Name.unique.name,
                         email: Faker::Internet.unique.email,
                         password: "bakingbad1234"
                         )
  bakery = Bakery.new(
    name: Faker::Name.unique.name + "'s Bakery",
    # description: Faker::Restaurant.description,
    description: Faker::Lorem.paragraph(sentence_count: 3),
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
  # 1st user buy to last user
  Order.create!(  user_id: User.last.id,
                  bread_id: User.first.bakery.breads.sample.id,
                  quantity: rand(10),
                  pick_up: DateTime.new(2020,8,13,rand(13..17),0,0)+ rand(1..15),
                  status: [0,1,2,3].sample
                  )
  # last user buy to first user
  Order.create!(  user_id: User.first.id,
                  bread_id: User.last.bakery.breads.sample.id,
                  quantity: rand(10),
                  pick_up: DateTime.new(2020,8,13,rand(13..17),0,0)+ rand(1..15),
                  status: [0,1,2,3].sample
                  )
end

puts "#{User.count} users created"
puts "#{Bakery.count} bakeries created"
puts "#{Bread.count} breads created"
puts "#{Order.count} order created"
