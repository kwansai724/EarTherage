class Schedule < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum public_status: {公開: 1, 非公開: 2, 中止: 3}
  # validates :date, presence: true
end
