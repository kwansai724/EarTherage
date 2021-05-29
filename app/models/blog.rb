class Blog < ApplicationRecord
  belongs_to :staff

  mount_uploader :image_name, ImageUploader
end
