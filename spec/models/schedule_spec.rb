require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it "is valid with event_type, area and teacher, and public_status" do
    schedule = Schedule.new(
      date: "2021/01/01",
      event_type: "イベント",
      title: "タイトル",
      area: "関東",
      teacher: "山本",
      public_status: "公開",
    )
    expect(schedule).to be_valid
  end
  
  it "is invalid without date" do
    schedule = Schedule.new(date: nil)
    schedule.valid?
    expect(schedule.errors[:date]).to include("を入力してください")
  end
  
  it "is invalid without title" do
    schedule = Schedule.new(title: nil)
    schedule.valid?
    expect(schedule.errors[:title]).to include("を入力してください")
  end

  
  # # 有効なファクトリを持つこと
  # it "has a valid factory" do
  #   expect(FactoryBot.build(:schedule)).to be_valid
  # end
end
