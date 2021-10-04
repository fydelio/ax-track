require 'ostruct'

module AxTrack
  class Object

    # pass in an array for getters which should be generated.
    # if nothing is passed in, it will create an instance variable for all instance variables.
    def create_getters(required_getter_methods = instance_variables.map { |attr_name| attr_name[1..-1 ]})
      required_getter_methods.each do |attr|
        singleton_class.send :attr_reader, attr unless self.respond_to? attr
        # define_singleton_method(v.to_s.tr('@','')) do
        #   instance_variable_get(v)
        # end
      end
    end

  end
end