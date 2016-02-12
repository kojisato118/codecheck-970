FactoryGirl.define do
  factory :project do
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
  end
end