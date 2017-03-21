CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.secrets.aws_access_key_id, # required
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key, # required
      region:                'us-east-1',
    }

    config.fog_directory  = connection.directories.create(
      :key    => "meowmates-#{Time.now.to_i}", # globally unique name
      :public => true
    )

  end
end

# config.fog_public     = true
# config.fog_directory  = 'meowmates'
# config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
