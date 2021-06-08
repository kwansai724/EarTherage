FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    datetime         { DateTime.current }
    staff
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/1/something1.jpg")) }
    share_with       { "staff" }

    trait :admin do
      staff          { FactoryBot.create(:staff, :admin) }
      image          { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/2/something2.jpg")) }
    end

    trait :therapist_training do
      share_with     { "therapist_training" }
    end

    trait :self_care do
      share_with     { "self_care" }
    end

    trait :general do
      share_with     { "general" }
    end

  end

end
