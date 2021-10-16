module AxTrack
  class Tracker
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