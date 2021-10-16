module AxTrack
  class Tracker < Object

    def asset_details
      @asset_details = Asset.new @asset_details unless @asset_details.is_a? Asset
      @asset_details
    end

    def name
      @name = @asset_details['name']
    end

    def last_message_timestamp
      DateTime.parse(@last_message_timestamp, false) if @last_message_timestamp
    end

    def last_gps_position
      GPSPosition.new(@last_gps_measurement || { lat: asset_details.lat, lng: asset_details.lng } )
    end

    def battery
      asset_details&.sensor_data.dig('battery', 'value')
    end

    def website_url
      "https://app.ax-track.ch/#/map/assets/#{@tracker_id}"
    end

    def available_sensor_data
      # returns a hash with available senson data
      sensor_data_temp = self.sensor_data.keys
      # if no timestamp is available in the GPSPosition, then there wasn't a last_gps_measurement returned in the json
      # hence the sensor doesn't contain a GPS module.
      sensor_data_temp = sensor_data_temp.unshift('gps') if self.last_gps_position.respond_to? :timestamp
      sensor_data_temp
    end
  end
end