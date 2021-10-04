module AxTrack
  class Asset < Object

    def initialize(json_response)
      create_getters json_response.keys

      json_response.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end

end