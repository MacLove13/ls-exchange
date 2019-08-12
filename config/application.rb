require_relative 'boot'

require 'rails/all'

require 'middleware/secure_cookies'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LsExchange
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #config.time_zone = 'Brasilia'
 	#config.active_record.default_timezone = :utc # Or :utc


 	config.time_zone = 'Brasilia'

    config.middleware.insert_after ActionDispatch::Static, Middleware::SecureCookies

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
