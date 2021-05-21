class Schedule < ApplicationRecord
  mount_uploader :image, ImageUploader


  # validates :date, presence: true
end
