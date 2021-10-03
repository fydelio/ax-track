# frozen_string_literal: true

require_relative "axTrack/version"

module AxTrack
  autoload :Client, 'axTrack/client'
  autoload :Collection, 'axTrack/collection'
  autoload :Error, 'axTrack/error'
  autoload :Object, 'axTrack/object'
  autoload :Resource, 'axTrack/resource'

  autoload :Tracker, 'axTrack/objects/tracker'
  autoload :TrackerList, 'axTrack/objects/tracker_list'

  autoload :TrackerResource, 'axTrack/resources/trackers'

  class TrackerData < Object; end
  class TrackersList < Object; end
end
