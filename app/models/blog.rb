class Blog < ApplicationRecord
  belongs_to :staff

  mount_uploader :image, BlogUploader
end
