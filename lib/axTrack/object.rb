require 'ostruct'

module AxTrack
  class Object

    def create_getters
      instance_variables.each do |v|
        define_singleton_method(v.to_s.tr('@','')) do
          instance_variable_get(v)
        end
      end
    end

  end
end