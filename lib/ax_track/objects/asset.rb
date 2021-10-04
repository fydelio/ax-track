module AxTrack
  class Asset < Object

    def initialize(json_response)
      # for each key create an own instance variable with a getter
      json_response.each do |key, value|
        instance_variable_set "@#{key}", value
      end

      create_getters
    end
  end

end