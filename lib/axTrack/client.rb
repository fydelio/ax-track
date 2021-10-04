require 'faraday'
require 'faraday_middleware'

module AxTrack

  class Client
    # include HttpStatusCodes
    # include ApiExceptions

    BASE_URL = 'https://prod.api.ax-track.ch/api/v1'.freeze

    attr_reader :api_key, :adapter
    def initialize(api_key: ENV['AXTRACK_API_KEY'], adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def tracker_list
      TrackerResource.new(self).list
    end

    def tracker(tracker_id)
      TrackerResource.new(self).show(tracker_id)
    end

    def last_gps_position(tracker_id)
      request(http_method: :get,
              endpoint: "trackers/#{tracker_id}",
              params: { fields: 'last_gps_measurement' },
              result_subset: 'last_gps_measurement')
    end

    def asset_list
      AssetResource.new(self).list
    end

    def asset(asset_id)
      AssetResource.new(self).show(asset_id)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        #conn.request :url_encoded
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter Faraday.default_adapter
        conn.headers['Authorization'] = "Token #{api_key}" unless api_key.empty?
      end
    end

  end
end