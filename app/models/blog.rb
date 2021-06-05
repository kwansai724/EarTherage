class Blog < ApplicationRecord
  belongs_to :staff
  mount_uploader :image, BlogUploader
  validates :title, presence: true
  validates :datetime, presence: true
end
