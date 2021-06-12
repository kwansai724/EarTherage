class Upload < ApplicationRecord
  mount_uploader :image, ScheduleUploader
end
