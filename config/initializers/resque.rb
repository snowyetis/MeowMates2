rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'

Resque.redis = Rails.env.production? ? $redis : "localhost:6379"
# resque_config = YAML.load_file(rails_root + '/config/resque.yml')
# Resque.redis = resque_config[rails_env]
