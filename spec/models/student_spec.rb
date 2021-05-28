require 'rails_helper'

RSpec.describe Student, type: :model do
  it "is valid with name, course_type and email, and password" do
    student = Student.new(
      name: "Aaron",
      course_type:  "therapist_training",
      email:        "sample-1@email.com",
      password:     "password",
    )
    expect(student).to be_valid
  end
  
  # 有効なファクトリを持つこと
  it "has a vilid factory" do
    expect(FactoryBot.build(:student)).to be_valid
  end
end
