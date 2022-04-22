# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


customer1 = Customer.create!(first_name: 'Jon', last_name: 'Doe', email: 'jon@mail.com', address: '12 Main St.')
customer2 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@mail.com', address: '21 6th St.')

subscription1 = customer1.subscriptions.create!(title: 'Creator Tier', price: 100, status: 0, frequency: 1)
subscription2 = customer1.subscriptions.create!(title: 'Mint Tier', price: 200, status: 1, frequency: 0)

tea1 = Tea.create!(title: 'Peach', description: 'Peach tea leaves', temperature: 90, brew_time: 100)
tea2 = Tea.create!(title: 'Mint', description: 'Mint tea leaves', temperature: 90, brew_time: 100)

subscription1.teas << tea1
subscription2.teas << tea2
