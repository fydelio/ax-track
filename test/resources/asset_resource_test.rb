require 'test_helper'
require 'faraday'

class AssetResourceTest < Minitest::Test
  def test_list
    stub = stub_request('/assets/', response: stub_response(fixture: "assets/list"))

    client = AxTrack::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    assets = client.assets.list

    assert_equal AxTrack::Collection, assets.class
    assert_equal AxTrack::Asset, assets.data.first.class
    assert_equal 2, assets.total
  end

  def test_retrieve
    asset_id = 1361
    stub = stub_request("/assets/#{asset_id}", response: stub_response(fixture: "assets/retrieve"))

    client = AxTrack::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    asset = client.assets.retrieve(asset_id)

    assert_equal AxTrack::Asset, asset.class
    assert_equal asset.id, asset_id
  end

  def test_update
    asset_id = 1361
    new_name = 'Changed'
    body = { name: new_name}
    stub = stub_request("/assets/#{asset_id}", method: :patch,
                                               body: body,
                                               response: stub_response(fixture: "assets/update"))

    client = AxTrack::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    asset = client.assets.update(asset_id, name: new_name)

    assert_equal AxTrack::Asset, asset.class
    assert_equal asset.id, asset_id
    assert_equal asset.name, new_name
  end

end