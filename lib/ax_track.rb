# frozen_string_literal: true

require_relative "ax_track/version"

module AxTrack
  autoload :Client, 'ax_track/client'
  autoload :Collection, 'ax_track/collection'
  autoload :Error, 'ax_track/error'
  autoload :Object, 'ax_track/object'
  autoload :Resource, 'ax_track/resource'

  autoload :Tracker, 'ax_track/objects/tracker'
  autoload :Asset, 'ax_track/objects/asset'

  autoload :TrackerResource, 'ax_track/resources/tracker_resource'
  autoload :AssetResource, 'ax_track/resources/asset_resource'

end
