class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :course_type, inclusion: { in: ["therapist_training","self_care"] }
end
