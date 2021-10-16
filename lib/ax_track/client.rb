require 'faraday'
require 'faraday_middleware'

module AxTrack

  class Client
    # include HttpStatusCodes
    # include ApiExceptions

    BASE_URL = 'https://prod.api.ax-track.ch/api/v1'.freeze

    APIKeyMissing = Class.new(StandardError)

    attr_reader :api_key, :adapter
    attr_writer :connection

    def initialize(api_key: nil, adapter: nil, stubs: nil)
      @api_key  = api_key || ENV['AXTRACK_API_KEY']
      @adapter  = adapter || Faraday.default_adapter
      @stubs    = stubs

      raise APIKeyMissing, "No API key provided" if !defined?(api_key) || api_key.nil? ||  api_key.empty?
    end

    def trackers
      TrackerResource.new(self)
    end


    def assets
      AssetResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        #conn.request :url_encoded
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter, @stubs
        conn.headers['Authorization'] = "Token #{api_key}" unless api_key.empty?
      end
    end
  end
end