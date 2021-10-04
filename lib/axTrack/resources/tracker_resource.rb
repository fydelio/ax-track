module AxTrack
  class TrackerResource < Resource

    def list(per_page: nil, cursor: nil)
      Collection.from_response response = request(endpoint: "trackers",
                                                  params: {per_page: per_page, cursor: cursor}.compact),
                               key: 'results',
                               type: Tracker
    end

    def show(tracker_id)
      Tracker.new request(http_method: :get,
                          endpoint: "trackers/#{tracker_id}").body
    end

  end
end