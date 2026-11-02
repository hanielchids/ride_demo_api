require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module RideDemoApi
  class Application < Rails::Application
    config.load_defaults 7.2
    config.api_only = true
    config.time_zone = "Africa/Johannesburg"
    config.generators do |g|
      g.test_framework :rspec
      g.orm :active_record, primary_key_type: :integer
    end
  end
end
