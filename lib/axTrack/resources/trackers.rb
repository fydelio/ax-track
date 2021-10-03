module AxTrack
  class TrackerResource < Resource

    def list
      TrackerList.new response = request(http_method: :get,
                                         endpoint: "trackers").body
    end

    def tracker(tracker_id)

      Tracker.new request(http_method: :get,
                          endpoint: "trackers/#{tracker_id}").body
    end
  end
end