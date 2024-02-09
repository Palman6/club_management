# frozen_string_literal: true

Sidekiq.strict_args!(false)

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' }
end
  
Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0' }
end
  