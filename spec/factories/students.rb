FactoryBot.define do
  factory :student do
    sequence(:name)  { |n| "student#{n%20}" }
    course_type      { "therapist_training" }
    sequence(:email) { |n| "sample-#{n%20}@email.com" }
    password         { "password" }
  end

  # セルフケアコース
    trait :self_care do
      course_type      { "self_care" }
   end

end
