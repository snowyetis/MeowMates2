# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment', __FILE__)
# Added for Heroku Cache Stroage
use Rack::Static, :urls => ['/carrierwave'], :root => 'tmp'
run Rails.application
