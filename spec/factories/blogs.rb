FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    datetime         { DateTime.current }
    staff
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/1/something1.jpg")) }

    trait :admin do
      staff          { FactoryBot.create(:staff, :admin) }
      image          { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/2/something2.jpg")) }
    end

  end

end
