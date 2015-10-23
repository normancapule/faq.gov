redis = Rails.application.config_for(:redis)

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis['host']}:#{redis['port']}/#{redis['db']||0}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis['host']}:#{redis['port']}/#{redis['db']||0}" }
end

