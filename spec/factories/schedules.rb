FactoryBot.define do
  factory :schedule do
    sequence(:date) { |n|  Date.today + ((n-1)%5).day }
    sequence(:title) { |n| "title#{n}" }
    event_type { "イベント" }
    area { "関東" }
    teacher { "山本" }
    public_status { "公開" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/uploads/schedule/image/1/something.jpg")) }
  end
end
