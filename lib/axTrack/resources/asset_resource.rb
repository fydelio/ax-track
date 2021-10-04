module AxTrack
  class AssetResource < Resource

    def list(per_page: nil, cursor: nil)
      Collection.from_response response = request(endpoint: "assets",
                                                  params: {per_page: per_page, cursor: cursor}.compact),
                               key: 'results',
                               type: Asset
    end

    def retrieve(asset_id)
      Asset.new request(http_method: :get,
                          endpoint: "assets/#{asset_id}").body
    end

    def update(asset_id, **attributes)
      Asset.new request(http_method: :patch,
                        endpoint:  "assets/#{asset_id}",
                        body: attributes).body

    end
  end
end