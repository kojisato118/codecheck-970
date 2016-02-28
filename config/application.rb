require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChallengeHerokuDeploy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Disable pipeline
    #config.assets.precompile = []

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')

    # herokuとローカルの切り分け。Settingとかでやりたい
    if Rails.env == 'production'
      autoload_paths = Dir[Rails.root.join('app/app', 'api', '*')]
      origins = 'https://sprint-react.herokuapp.com'
    else
      autoload_paths = Dir[Rails.root.join('app/app', 'api', '*')]
      origins = 'http://localhost:5000/'
    end
    config.autoload_paths += autoload_paths

    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins origins
        resource '*', :headers => :any, :methods => [:get, :post, :options, :patch, :delete]
      end
    end
  end
end
