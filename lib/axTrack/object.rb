require 'ostruct'

module AxTrack
  class Object

    def create_getters(required_getter_methods = instance_variables)
      required_getter_methods.each do |attr|
        singleton_class.send :attr_reader, attr
        # define_singleton_method(v.to_s.tr('@','')) do
        #   instance_variable_get(v)
        # end
      end
    end

    def create_attr_accessors(arr)
      arr.each do |attribute|
        singleton_class.send :attr_accessor, attribute
      end
    end

  end
end