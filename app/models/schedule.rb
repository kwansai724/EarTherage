class Schedule < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum public_status: {公開: 1, 非公開: 2, 中止: 3}
  # validates :date, presence: true


  # 検索機能
  def self.search(search)
    return Schedule.all unless search
    Schedule.where(['area LIKE? OR event_type LIKE? OR teacher LIKE?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
