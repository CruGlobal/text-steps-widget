# frozen_string_literal: true

require_relative "boot"

# require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative "../lib/log/logger"
module StepInvitationPlatform
  class Application < Rails::Application
    unless ENV["HEROKU"]
      # Enable ougai
      if Rails.env.development? || Rails.const_defined?("Console")
        config.logger = Log::Logger.new($stdout)
      elsif !Rails.env.test? # use default logger in test env
        config.logger = Log::Logger.new(Rails.root.join("log", "datadog.log"))
      end
      config.log_formatter = ::Logger::Formatter.new
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_dispatch.default_headers = {
      "X-Frame-Options" => "ALLOWALL"
    }

    config.assets.initialize_on_precompile = false
  end
end
