class Blog < ApplicationRecord
  belongs_to :staff
  mount_uploader :image, BlogUploader
  validates :title, presence: true
  validates :datetime, presence: true
  enum share_with: { "staff"=> 0, "therapist_training"=> 1, "self_care"=> 2, "general"=> 3 }, _prefix: true
end
