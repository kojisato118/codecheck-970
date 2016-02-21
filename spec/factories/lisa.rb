FactoryGirl.define do
  factory :lisa do
    lisa_id {Random.rand(1 .. 10000)}
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
    image {Faker::Avatar.image}
  end
end