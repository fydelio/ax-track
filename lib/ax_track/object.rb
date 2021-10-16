require 'ostruct'

module AxTrack
  class Object

    def initialize(json_response)
      # for each key create an own instance variable with a getter
      json_response.each do |key, value|
        instance_variable_set "@#{key}", value
      end

      create_getters
    end

    # pass in an array for getters which should be generated.
    # if nothing is passed in, it will create an instance variable for all instance variables.
    def create_getters(required_getter_methods = instance_variables.map { |attr_name| attr_name[1..-1 ]})
      required_getter_methods.each do |attr|
        singleton_class.send :attr_reader, attr unless self.respond_to? attr
      end
    end

  end
end