# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ax-track"

require "minitest/autorun"
require "json"

class Minitest::Test

  def stub_response(fixture:, status: 200, headers: {'Content-Type' => 'application/json'})
    [status, headers, File.read("test/fixtures/#{fixture}.json")]
  end

  def stub_request(path, response:, method: :get, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      path = "/#{path}" unless path[0] == '/'
      path = "#{path}/" unless path[-1] == '/'
      path = AxTrack::Client::BASE_URL + path

      arguments = [method, path]
      # add in the body whenever it's required
      arguments << body.to_json if [:post, :put, :patch].include? method
      stub.send(*arguments) { |env| response }
    end
  end

end