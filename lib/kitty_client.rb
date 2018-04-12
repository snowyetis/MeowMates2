require 'httparty'

class KittyClient
  include HTTParty
  base_uri   'http://api.petfinder.com'
  filename = 'secrets'
  configFile = YAML.load_file(filename)

  def initialize(api_key = configFile['pet_key'], api_secret = configFile['pet_secret'])
    # @api_key, @api_secret = api_key, api_secret
    @auth = {api_key: configFile['pet_key'], api_secret: configFile['pet_secret'] }
    # raise KittyClient::Error.new("API key is required") unless @api_key
  end

  def self.list_breeds
    options.merge!({basic_auth: @auth })
    response = self.class.get("/breed.list/?format=json")

    if response.success?
      new(response)
    else
      raise response.response
    end
  end


    # def token
    #   response = perform_get("/auth.getToken", { sig: digest_key_and_secret })
    #   Auth.new(response).token
    # end
    #
    # private
    #
    #   def digest_key_and_secret
    #     raise "API secret is required" unless @api_secret
    #     Digest::MD5.hexdigest(@api_secret + "key=#{@api_key}")
    #   end
    #
    # def perform_get(uri, options = {})
    #   connection = Excon.new(base_uri, omit_default_port: true)
    #   response = connection.get(path: uri, query: options.merge(key: @api_key))
    #
    #   rescue RuntimeError => ex
    #     raise KittyClient::Error.new(ex.message)
    #   end
    #
    # end

  # def set_auth
  #   self.class.configure do |config|
  #     config.api_key = configFile['pet_key']
  #     config.api_secret = configFile['pet_secret']
  #   end

end
