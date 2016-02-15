require 'faker'

namespace :dummy_data do
  task :create => :environment do
    for i in 0..100
      now = Time.zone.now
      now -= Random.rand(1 .. 200).day
      Project.create(title: Faker::Name.title, description: Faker::Name.title, url: Faker::Internet.url, created_at: now)
    end
  end
end
