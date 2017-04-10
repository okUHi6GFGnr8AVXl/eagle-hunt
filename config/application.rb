require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Viramobl
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # 1. forces the browser to redirect HTTP to HTTPS.
    # 2. it also sets your cookies to be marked "secure",
    # 3. and it enables HSTS
    config.force_ssl = Rails.env.production?
    
    # translation directories
    config.i18n.default_locale = :fa
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # add lib to auto-loading path
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # include all extensions
    Dir["#{config.root}/lib/extensions/*.rb"].each {|file| require file }
  end
end
