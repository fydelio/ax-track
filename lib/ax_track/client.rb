require 'faraday'
require 'faraday_middleware'

module AxTrack

  class Client
    APIKeyMissing = Class.new(StandardError)

    attr_reader :api_key, :adapter
    attr_writer :connection

    def initialize(api_key: nil, adapter: nil, stubs: nil)
      @api_key  = api_key&.strip || ENV['AXTRACK_API_KEY']&.strip
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
      @connection ||= Faraday.new(AxTrack.base_url_api) do |conn|
        #conn.request :url_encoded
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter, @stubs
        conn.headers['Authorization'] = "Token #{api_key}" unless api_key.empty?
        conn.options.timeout = 20
      end
    end
  end
end