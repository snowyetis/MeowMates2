CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.secrets.aws_access_key_id, # required
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key, # required
      region:                'us-east-2',
    }
    config.fog_directory = 'meowmates'
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
# config.fog_directory  = 'meowmates'
# config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
