FactoryGirl.define do
  factory :lab do
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
    image {Faker::Internet.url}
  end
end