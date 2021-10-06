module AxTrack
  class Tracker < Object

    def initialize(json_response)
      @tracker_id =       json_response['id']
      @asset_id =         json_response['asset']
      @url =              json_response['url']
      @active =           json_response['active']
      @model =            json_response['model']
      @asset_details      = Asset.new json_response['asset_details'] if json_response['asset_details']
      @name =             json_response.dig('asset_details', 'name')
      @last_message_timestamp = DateTime.parse(json_response['last_message_timestamp'], false) if json_response['last_message_timestamp']
      @url =              json_response['url']
      @user_url =         website_url(@asset_id)
      @last_gps_position = GPSPosition.new(json_response['last_gps_measurement'] || json_response['asset_details'])

      @battery =          json_response.dig('asset_details', 'sensor_data', 'battery', 'value')

      sensor_data =       json_response.dig('asset_details', 'sensor_data')
      sensor_data.delete('battery')
      @sensor_data =      sensor_data

      create_getters
    end

    def available_sensor_data
      # returns a hash with available senson data
      self.sensor_data.keys
    end

    def website_url
      "https://app.ax-track.ch/#/map/assets/#{id}"
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