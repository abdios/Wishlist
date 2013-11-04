# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: 'true')

User.create(username: 'Test', email: 'test', password: 'test', password_confirmation: 'test')

Product.create(name: 'Dominion', description: 'You are a monarch, like your parents before you, a ruler of a small pleasant kingdom of rivers and evergreens.', price: '4000')
Product.create(name: 'Ticket to ride', description: 'Ticket to Ride is a cross-country train adventure game. Players collect train cards that enable them to claim railway routes connecting cities throughout North America.', price: '3000')
Product.create(name: 'Settlers of catan', description: 'The Settlers of Catan from Mayfair Games is an award-winning strategy game where players collect resources and use them to build roads, settlements and cities on their way to victory.', price: '4000')
Product.create(name: 'Alhambra', description: 'Compete against your opponents to build the greatest and most impressive Alhambra.', price: '40.00')

Wish.create(product_id: '1', user_id: '1')
Wish.create(product_id: '2', user_id: '1')
Wish.create(product_id: '3', user_id: '1')
Wish.create(product_id: '4', user_id: '2')
Wish.create(product_id: '1', user_id: '2')
Wish.create(product_id: '2', user_id: '2')
Wish.create(product_id: '3', user_id: '2')