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
  autoload :GPSPosition, 'ax_track/objects/tracker/gps_position'

  autoload :TrackerResource, 'ax_track/resources/tracker_resource'
  autoload :AssetResource, 'ax_track/resources/asset_resource'

  @@base_url_api = 'https://prod.api.ax-track.ch/api/v1'.freeze
  @@base_url_user = 'https://app.ax-track.ch/#/map/assets/'.freeze
  InvalidURL = Class.new(StandardError)

  def self.base_url_api
    @@base_url_api
  end

  def self.set_base_url_api=(new_base_url_api)
    raise InvalidURL.new 'This is not a valid URL' unless new_base_url_api =~ URI::regexp
    @@base_url_api = new_base_url_api

  end

  def self.base_url_user
    @@base_url_user
  end

  def self.set_base_url_user=(new_base_url_user = nil)
    raise InvalidURL.new 'This is not a valid URL' unless new_base_url_user =~ URI::regexp
    new_base_url_user = new_base_url_user + "/" unless new_base_url_user[-1] == '/'
    @@base_url_user = new_base_url_user
  end



end
