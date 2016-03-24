class Gab < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid_and_title, use: :slugged

  mount_uploaders :images, ImagesUploader
  belongs_to :user
  before_create :set_uuid_url
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 15 }


  def uuid_and_title
    "#{self.uuid_url}-#{self.title}"
  end

    private

      def set_uuid_url
        self.uuid_url = SecureRandom.urlsafe_base64(32)
      end

end
