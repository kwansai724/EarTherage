FactoryBot.define do
  factory :student do
    sequence(:name)  { |n| "student#{n}" }
    course_type      { "therapist_training" }
    sequence(:email) { |n| "sample-#{n}@email.com" }
    password         { "password" }
  end

  # セルフケアコース
    trait :self_care do
      course_type      { "self_care" }
   end

end
