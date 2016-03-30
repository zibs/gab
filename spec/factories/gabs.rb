FactoryGirl.define do
  factory :gab do
    association :user, factory: :user
    title {Faker::Hipster.sentence}
    uuid_url nil
    body { "#{Faker::Lorem.paragraph(30)} and an image: #{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'https.png'))}" }
    slug nil
  end
end
