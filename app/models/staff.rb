class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :database_authenticatable, :recoverable,  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :rememberable, :validatable
end
