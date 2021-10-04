module AxTrack
  class AssetResource < Resource

    def list(per_page: nil, cursor: nil)
      Collection.from_response response = request(endpoint: "assets",
                                                  params: {per_page: per_page, cursor: cursor}.compact),
                               key: 'results',
                               type: Asset
    end

    def show(asset_id)

      Asset.new request(http_method: :get,
                          endpoint: "assets/#{asset_id}").body
    end
  end
end