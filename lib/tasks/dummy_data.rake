require 'faker'

namespace :dummy_data do
  task :create => :environment do
    for i in 0..1000
      Project.create(title: Faker::Name.title, description: Faker::Name.title, url: Faker::Internet.url)
    end
  end
end
