class Blog < ApplicationRecord
  belongs_to :staff
  mount_uploader :image, BlogUploader
  validates :title, presence: true
  validates :datetime, presence: true
  enum share_with: { "staff"=> 0, "therapist_training"=> 1, "self_care"=> 2, "general"=> 3, "private"=> 4 }, _prefix: true

#検索機能--------------------------------------------------------------------
  #閲覧可能範囲による絞り込み
  scope :get_by_staff_name, ->(staff_name) { where(staff_name: staff_name) }
#----------------------------------------------------------------------------

end
