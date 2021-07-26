class Staff < ApplicationRecord
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
end
