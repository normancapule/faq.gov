require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'multi_json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FaqGov
  class Application < Rails::Application
    MultiJson.engine = :Oj
    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.template_engine nil #to skip views
      g.test_framework  nil #to skip test framework
      g.assets  false
      g.helper false
      g.stylesheets false
    end
  end
end
