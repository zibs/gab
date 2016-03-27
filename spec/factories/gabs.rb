FactoryGirl.define do
  factory :gab do
    association :user, factory: :user
    title {Faker::Hipster.sentence}
    uuid_url nil
    body {Faker::Lorem.paragraph(30)}
    slug nil
  end
end
