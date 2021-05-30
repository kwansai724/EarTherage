FactoryBot.define do
  factory :staff do
    name        { "staff" }
    email       { "sample1@email.com" }
    password    { "password" }
    admin       { false }
  end

  # 管理者
  trait :admin do
    admin       { true }
  end
end
