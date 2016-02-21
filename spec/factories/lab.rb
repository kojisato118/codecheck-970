FactoryGirl.define do
  factory :lab do
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
    image {Faker::Avatar.image}
  end
end