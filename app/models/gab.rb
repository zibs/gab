class Gab < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid_and_title, use: :slugged

  mount_uploaders :images, ImagesUploader
  belongs_to :user

  after_initialize :set_uuid_url
  before_save :append_title_to_body

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 15 }

  def uuid_and_title
    "#{uuid_url}-#{title}"
  end

    private

      def append_title_to_body
        self.body = "<h1 style='text-center'>#{title}</h1><br>#{body}"
      end

      def set_uuid_url
        self.uuid_url = SecureRandom.urlsafe_base64(16)
      end

end
