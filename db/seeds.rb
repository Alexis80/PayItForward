# This file should contain all the record creation needed to seed the database with its default values.i
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# From railstutorial.org on 4/19/19
#
User.create!(name:  "Example Admin",
             email: "example@ex.org",
             address: "123 My Avenue",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  address = "576 Faker Street"
  password = "password"
  User.create!(name:  name,
               email: email,
               address: address,
               password:              password,
               password_confirmation: password)
end
