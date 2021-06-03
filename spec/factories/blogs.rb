FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    datetime         { DateTime.current }
    staff
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/1/something.jpg")) }

    trait :admin do
      staff { FactoryBot.create(:staff, :admin) }
    end

  end

end
