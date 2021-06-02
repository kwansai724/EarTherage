FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    datetime         { DateTime.now }
    staff
    sequence(:image) { |n| Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/blog/image/#{n}/something.jpg")) }

    trait :admin do
      staff { FactoryBot.create(:staff, :admin) }
    end

  end

end
