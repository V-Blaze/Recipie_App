# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create some users
User.create!([
    { name: 'Trust', email: 'test2@test.com', password: '123456', password_confirmation: '123456' },
    { name: 'Valentine', email: 'test3@test.com', password: '123456', password_confirmation: '123456' }
   ])

   #Create some recipes
Recipe.create!([
    {name: 'Cake', description: 'Delicious cake recipe', preparation_time: 30.3, cooking_time: 40, public: true, user_id: 1},
    {name: 'Pizza', description: 'Delicious Pizza recipe', preparation_time: 30.3, cooking_time: 40, public: false, user_id: 1}
])

#Create some food
Food.create!([
    {name: 'Turkey', measurement_unit: 'grams', price: '20.0', quantity: 4, user_id: 1},
    {name: 'Sausage', measurement_unit: 'kg', price: '5.0', quantity: 10, user_id: 1}
])