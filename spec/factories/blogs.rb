FactoryBot.define do
  factory :blog do
    title { "MyString" }
    datetime { DateTime.now }
    staff
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/uploads/blog/image/1/something.jpg')) }

    trait :admin do
      staff { FactoryBot.create(:staff, :admin) }
    end

  end

end
