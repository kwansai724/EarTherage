require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:schedule)).to be_valid
  end
  
  it "is invalid without date" do
    schedule = FactoryBot.build(:schedule, date: "")
    schedule.valid?
    expect(schedule.errors[:date]).to include("を入力してください")
  end
  
  it "is invalid without title" do
    schedule = FactoryBot.build(:schedule, title: "")
    schedule.valid?
    expect(schedule.errors[:title]).to include("を入力してください")
  end
  
end
