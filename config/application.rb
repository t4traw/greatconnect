require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Greatconnect
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
  end
end
