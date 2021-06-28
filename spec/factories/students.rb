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

  #　サンプルの受講生
    trait :sample do
      sequence(:email) { |n| "sample--#{n%20}@email.com" }
    end

  # system_studentの受講生
    trait :system_student do
      sequence(:name)  { |n| "student---#{n%10}" }
      sequence(:email) { |n| "sample---#{n%10}@email.com" }
    end

  # self_care_system_studentの受講生
    trait :self_care_system_student do
      sequence(:name)  { |n| "student----#{n%10}" }
      sequence(:email) { |n| "sample----#{n%10}@email.com" }
      course_type      { "self_care" }
    end
end
