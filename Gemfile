source 'https://rubygems.org'
ruby '2.2.4'

gem 'rails', '4.2.5'
gem 'rails-api'

group :development do
  gem 'spring'
  gem 'sqlite3'
end

group :production do
  gem 'thin'
  gem 'rails_12factor'
  gem 'pg'
end

# Web Server recommended by Heroku
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#config
gem 'puma'

gem 'grape'
gem 'factory_girl'
gem 'faker'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end