# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  course_type = "therapist_training"
  phone_number = Faker::Number.number(digits: 11)
  password = "password"
  Student.create!(
    name: name,
    email: email,
    course_type: course_type,
    phone_number: phone_number,
    password: password,
    password_confirmation: password,
  )
end

puts "Therapist training course students Created"

10.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+11}@email.com"
  course_type = "self_care"
  phone_number = Faker::Number.number(digits: 11)
  password = "password"
  Student.create!(
    name: name,
    email: email,
    course_type: course_type,
    phone_number: phone_number,
    password: password,
    password_confirmation: password,
  )
end

puts "Self care course students Created"

Staff.create!(
  name: "管理者",
  email: "sample0@email.com",
  admin: true,
  password: "password",
  password_confirmation: "password",
)

puts "Admin Created"

10.times do |n|
  email = "sample#{n+1}@email.com"
  password = "password"
  Staff.create!(
    name: Faker::Name.name,
    email: email,
    admin: false,
    password: password,
    password_confirmation: password,
  )
end

puts "Staff Created"

