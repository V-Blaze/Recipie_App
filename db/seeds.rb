# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Jack Frost', email: 'jackfrost@gmail.com', password: '123456');

second_user = User.create(name: 'Peter Parker', email: 'peterparker@gmail.com', password: '123456');

Food.create(name: 'Turkey', measurement_unit: 'grams', price: '20.0', quantity: 4, user: first_user, user_id: first_user.id)
Food.create(name: 'Potato', measurement_unit: 'grams', price: '5.0', quantity: 2, user: first_user, user_id: first_user.id)
Food.create(name: 'Strawberry', measurement_unit: 'grams', price: '10.0', quantity: 10, user: sec_user, user_id: sec_user.id)