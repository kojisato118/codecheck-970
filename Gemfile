source 'https://rubygems.org'
ruby '2.2.4'

gem 'rails', '4.2.5'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'spring'
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'minitest'
  gem 'shoulda-matchers', '2.5.0'
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
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'factory_girl'
gem 'faker'
gem 'kaminari'
gem 'masonry-rails'
gem 'slim-rails'
gem 'rails_admin'
gem 'paperclip'
gem 'rmagick'
gem 'faraday'