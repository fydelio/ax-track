module AxTrack
  class TrackerList

    attr_reader :count, :results

    def initialize(json_response)
      @count    = json_response['count']
      @results  = json_response['results'].map { |result| Tracker.new result}
    end

  end

end