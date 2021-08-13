class Background < ApplicationRecord
  mount_uploader :image, BackgroundUploader
end
