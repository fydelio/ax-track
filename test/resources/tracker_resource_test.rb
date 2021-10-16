require 'test_helper'
require 'faraday'

class TrackerResourceTest < Minitest::Test
  def test_list
    stub = stub_request('/trackers', response: stub_response(fixture: "trackers/list"))

    client = AxTrack::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    tracker = client.trackers.list

    assert_equal AxTrack::Collection, tracker.class
    assert_equal AxTrack::Tracker, tracker.data.first.class
    assert_equal 2, tracker.total
  end

  def test_retrieve
    tracker_id = 1355
    stub = stub_request("/trackers/#{tracker_id}", response: stub_response(fixture: "trackers/retrieve"))

    client = AxTrack::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    tracker = client.trackers.retrieve(tracker_id)

    assert_equal AxTrack::Tracker, tracker.class
    assert_equal tracker.id, tracker_id
  end

end