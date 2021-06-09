FactoryBot.define do
  factory :student do
    name        { "Aaron" }
    course_type { "therapist_training" }
    email       { "sample-1@email.com" }
    password    { "password" }
  end
end
