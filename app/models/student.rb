class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :recoverable, :database_authenticatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :rememberable, :validatable
end
