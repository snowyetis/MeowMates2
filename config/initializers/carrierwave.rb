CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     <%= ENV['aws_access_key_id'] %>,
      aws_secret_access_key: <%= ENV['aws_secret_access_key'] %>,
      region:                'us-east-1',
    }
    config.fog_directory  = 'meowmates'
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
end
