class Gab < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid_and_title, use: :slugged

  mount_uploaders :images, ImagesUploader
  belongs_to :user

  after_initialize :set_uuid_url
  before_save :markdownify_title
  before_save :check_if_html_title_changed


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 15 }

  def uuid_and_title
    "#{uuid_url}-#{title}"
  end

    private

    def markdownify_title
      self.html_title = "<h1 style='text-center'>#{title}</h1>"
    end

    def check_if_html_title_changed
      if self.title_changed?
        self.html_title = "<h1 style='text-center'>#{title}</h1>"
      end
    end

      def set_uuid_url
        self.uuid_url = SecureRandom.urlsafe_base64(16)
      end

end
