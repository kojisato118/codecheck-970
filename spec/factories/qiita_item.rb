FactoryGirl.define do
  factory :quiita_item do
    qiita_item_id {Faker::Code.ean}
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
    image {Faker::Internet.url}
  end
end