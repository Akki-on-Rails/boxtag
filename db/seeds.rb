# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seed: Deleting existing records...'
UserCollection.delete_all
User.delete_all
Item.delete_all
Box.delete_all
Collection.delete_all


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
  description: "All boxes are inside this room"
  # user_id: user1.id
)

collection2 = Collection.create!(
  name: "My storage room",
  description: "All boxes are inside this room",
  # user_id: user2.id
)

collection3 = Collection.create!(
  name: "test collection",
  description: "Here I stored some boxes to test the display as well as the search funktion. To test if all is displayed well I added a pretty long text. I mean... it is really long...! ",
  # user_id: user2.id
)

collection3 = Collection.create!(
  name: "kim's storage room",
  description: "All boxes are inside this room"
  # user_id: user1.id

)

user_collection1 = UserCollection.create!(
  user: user1,
  collection: collection1,
  kind: 0
)

user_collection2 = UserCollection.create!(
  user: user2,
  collection: collection2,
  kind: 0
)

user_collection3 = UserCollection.create!(
  user: user2,
  collection: collection1,
  kind: 1
)

user_collection4 = UserCollection.create!(
  user: user2,
  collection: collection3,
  kind: 0
)

box1 = Box.create!(
  name: "white box",
  description: "This is my first box",
  collection: collection1
)

box2 = Box.create!(
  name: "black box",
  description: "All my kids toys inside the box",
  collection: collection1
)

box3 = Box.create!(
  name: "all stuff",
  description: "All different stuff inside the box",
  collection: collection3
)

item1 = Item.create!(
  name: "toy",
  box: box1
)

item2 = Item.create!(
  name: "box item",
  box: box3
)
