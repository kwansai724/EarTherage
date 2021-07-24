class Schedule < ApplicationRecord
  mount_uploader :image, ScheduleUploader
  validates :date, presence: true
  validates :title, presence: true


#検索機能--------------------------------------------------------------------
  enum public_status: {公開: 1, 非公開: 2, 中止: 3}

  #開催エリアによる絞り込み
  scope :get_by_area, ->(area) {
    where(area: area)
  }
  #種別による絞り込み
  scope :get_by_event_type, ->(event_type) {
    where(event_type: event_type)
  }
  #講師による絞り込み
  scope :get_by_teacher, ->(teacher) {
    where(teacher: teacher)
  }

#----------------------------------------------------------------------------
end
