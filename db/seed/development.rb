# 開発環境用
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

5.times do |n|
  date  = Faker::Date.in_date_period(month: 2)
  title = Faker::Educator.degree
  # area = Faker::Address.state
  # teacher = Faker::Name.first_name
  Schedule.create!(date: date,
              event_type: "イベント",
              title: title,
              area: "関東",
              teacher: "山本",
              public_status: "公開"
#               # image: File.open("public/uploads/schedule/image/1/something.jpg")
              )
end
puts 'スケジュール作成'

5.times do |n|
  datetime = DateTime.current
  title = Faker::Educator.degree
  Blog.create!(datetime: datetime,
              title: title,
              #  image: File.open("public/uploads/blog/image/1/something.jpg"),
              staff_id: n+1,
              share_with: n%4
              )
end

puts "ブログ作成"
