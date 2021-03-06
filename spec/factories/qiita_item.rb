FactoryGirl.define do
  factory :qiita_item do
    qiita_item_id {Faker::Code.ean}
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph}
    url {Faker::Internet.url}
    image {Faker::Avatar.image}
  end
end