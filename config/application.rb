require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LsExchange
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

   	config.time_zone = 'Brasilia'

   	config.i18n.default_locale = 'pt-BR'

   	# Bootstrap
  	root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
  	  config.sass.load_paths << bower_path
  	  config.assets.paths << bower_path
  	end
  	# Precompile Bootstrap fonts
  	config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
  	# Minimum Sass number precision required by bootstrap-sass
  	::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

  	# Sentry

    config.filter_parameters << :password
    
  	Raven.configure do |config|
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
