# coding: utf-8

5.times do |n|
  date  = Faker::Date.in_date_period(month: 2)
  title = Faker::Educator.degree
  area = Faker::Address.state
  teacher = Faker::Name.first_name
  Schedule.create!(date: date,
              title: title,
              area: area,
              teacher: teacher,
              )
end
puts 'スケジュール作成'