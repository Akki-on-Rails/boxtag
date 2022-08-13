# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seed: Deleting existing records...'

user1 = User.create!(
  email: "menakadevisundaramoorthy@gmail.com",
  first_name: "Menakadevi",
  last_name: "sundaramoorthy",
  password: "123456",
  password_confirmation: "123456"
)

user2 = User.create!(
  email: "phillippkern@gmail.com",
  first_name: "phillip",
  last_name: "kern",
  password: "123456",
  password_confirmation: "123456"
)
user3 = User.create!(
  email: "kimoliverm@gmail.com",
  first_name: "kim-Oliver",
  last_name: "Hein",
  password: "123456",
  password_confirmation: "123456"
)

collection1 = Collection.create!(
  name: "My storage room",
  description: "All boxes are inside this room",
  user_id: user1.id

)


box1 = Box.create!(
  name: "white box",
  description: "This is my first box",
  # user_id: user1.id,
  collection_id: collection1.id
)

box2 = Box.create!(
  name: "black box",
  description: "All my kids toys inside the box",
  # user_id: user2.id,
  collection_id: collection1.id
)

item1 = Item.create!(
  name: "toy",
  box_id: box1.id
)
