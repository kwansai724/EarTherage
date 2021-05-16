# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(
  #password: "password",
  admin: true,
  name: "山本さん",
  email: "sample0@email.com",
)

puts "Admin Created"

10.times do |n|
  name  = Faker::Name.name
  email = "sample#{n+1}@email.com"
  Staff.create!(
    admin: false,
    name: name,
    email: email,
  )
end

puts "Staff Created"


10.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  phone_number = Faker::Number.number(digits: 11)
  Student.create!(
    name: name,
    email: email,
    course_type: "Therapist",
    phone_number: phone_number,
  )
end

puts "Therapist Created"

10.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+10}@email.com"
  phone_number = Faker::Number.number(digits: 11)
  Student.create!(
    name: name,
    email: email,
    course_type: "Self_care",
    phone_number: phone_number,
  )
end

puts "Self_care Created"

