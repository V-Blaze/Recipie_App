# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create some users
User.create!([
    { email: 'test2@test.com', password: '123456', password_confirmation: '123456' },
    { email: 'test3@test.com', password: '123456', password_confirmation: '123456' }
   ])

   #Create some recipes
Recipe.create!([
    {name: 'Cake', description: 'Delicious cake recipe', preparation_time: 30.3, cooking_time: 40, public: true, user_id: 1}
    {name: 'Pizza', description: 'Delicious Pizza recipe', preparation_time: 30.3, cooking_time: 40, public: false, user_id: 1}
])
