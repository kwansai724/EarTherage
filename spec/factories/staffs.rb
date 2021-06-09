FactoryBot.define do
  factory :staff, aliases: [:owner] do
    sequence(:name)  { |n| "staff#{n}" }
    sequence(:email) { |n| "sample#{n}@email.com" }
    password         { "password" }
    admin            { false }
  end

  # 管理者
  trait :admin do
    name             { "管理者" }
    sequence(:email) { |n| "sample0-#{n}@email.com" }
    admin            { true }
  end
end
