module AxTrack
  class Tracker < Object

    def initialize(json_response)
      @id =               json_response['id']
      @url =              json_response['url']
      @active =           json_response['active']
      @model =            json_response['model']
      @axtrack_asset_id = json_response['asset']
      @asset_details      = Asset.new json_response['asset_details'] if json_response['asset_details']
      @name =             json_response.dig('asset_details', 'name')
      @last_message_timestamp = DateTime.parse(json_response['last_message_timestamp'], false) if json_response['last_message_timestamp']
      @url =              json_response['url']
      @last_gps_position = GPSPosition.new(json_response['last_gps_measurement'] || json_response['asset_details'])

      @battery =          json_response.dig('asset_details', 'sensor_data', 'battery', 'value')

      sensor_data =       json_response.dig('asset_details', 'sensor_data')
      sensor_data.delete('battery')
      @sensor_data =      sensor_data

      create_getters
    end

    def available_sensor_data
      # returns a hash with available senson data
      self.senson_data.keys
    end

    def last_gps_position
      self.last_gps_position
    end

    class GPSPosition < Object

      def initialize(json_response)
        @lat =       json_response['lat']
        @lng =       json_response['lng']
        @timestamp = DateTime.parse(json_response['timestamp'], false) if json_response['timestamp']

        create_getters
      end

    end

  end
end