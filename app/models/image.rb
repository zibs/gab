class Image < ActiveRecord::Base
  belongs_to :gab

  mount_uploader :image, ImageUploader

end
