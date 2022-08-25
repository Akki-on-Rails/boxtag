# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts 'Seed: Deleting existing records...'
UserCollection.delete_all
User.delete_all
Item.delete_all
Box.delete_all
Collection.delete_all

############## User ###################

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
  email: "kimoliverhein@yahoo.de",
  first_name: "kim-Oliver",
  last_name: "Hein",
  password: "123456",
  password_confirmation: "123456"
)

user4 = User.create!(
  email: "johndoe@gmail.com",
  first_name: "john",
  last_name: "Doe",
  password: "123456",
  password_confirmation: "123456"
)

user5 = User.create!(
  email: "big@lebowski.de",
  first_name: "Big",
  last_name: "Lebowski",
  password: "123456",
  password_confirmation: "123456"
)

###### genereate collections / Boxes and Items

5.times do |i|
  collection = Collection.create(
        name: Faker::Beer.brand,
        description: Faker::ChuckNorris.fact
      )
    10.times do |i|
      box = Box.create(
        name: Faker::DcComics.villain,
        description: Faker::DcComics.title,
        collection: collection
      )
      5.times do |i|
        Item.create(
          name: Faker::Hipster.word,
          box: box
        )
    end
  end
end

##### generating User Collections

Collection.all.each do |collection|
  UserCollection.create(
    user: User.all.sample,
    collection: collection,
    kind: 0
  )
  UserCollection.create(
    user: User.all.sample,
    collection: collection,
    kind: 1
  )
end
