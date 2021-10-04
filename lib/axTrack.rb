# frozen_string_literal: true

require_relative "axTrack/version"

module AxTrack
  autoload :Client, 'axTrack/client'
  autoload :Collection, 'axTrack/collection'
  autoload :Error, 'axTrack/error'
  autoload :Object, 'axTrack/object'
  autoload :Resource, 'axTrack/resource'

  autoload :Tracker, 'axTrack/objects/tracker'
  autoload :Asset, 'axTrack/objects/asset'

  autoload :TrackerResource, 'axTrack/resources/tracker_resource'
  autoload :AssetResource, 'axTrack/resources/asset_resource'

  class TrackerData < Object; end
  class TrackersList < Object; end
end
