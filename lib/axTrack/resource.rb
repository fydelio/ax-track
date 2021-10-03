
module AxTrack
  class Resource
    attr_reader :client, :response

    GithubAPIError = Class.new(StandardError)
    BadRequestError = Class.new(GithubAPIError)
    UnauthorizedError = Class.new(GithubAPIError)
    ForbiddenError = Class.new(GithubAPIError)
    ApiRequestsQuotaReachedError = Class.new(GithubAPIError)
    NotFoundError = Class.new(GithubAPIError)
    UnprocessableEntityError = Class.new(GithubAPIError)
    ApiError = Class.new(GithubAPIError)

    HTTP_OK_CODE = 200

    HTTP_BAD_REQUEST_CODE = 400
    HTTP_UNAUTHORIZED_CODE = 401
    HTTP_FORBIDDEN_CODE = 403
    HTTP_NOT_FOUND_CODE = 404
    HTTP_UNPROCESSABLE_ENTITY_CODE = 429

    def initialize(client)
      @client = client
      @response = nil
    end

    def request(http_method: :get, endpoint:, headers: {}, params: {}, result_subset: nil)
      raise "Client not defined" unless defined? @client
      endpoint = endpoint + "/" unless endpoint[-1] == "/"
      @response = client.connection.public_send(http_method, endpoint, params)

      unless response_successful?
        raise error_class(response.status), "Code: #{response.status}, response: #{response.reason_phrase}"
      end

      result_subset ? response[result_subset.to_s] : response
    end

    def error_class(status)
      case status
      when HTTP_BAD_REQUEST_CODE
        BadRequestError
      when HTTP_UNAUTHORIZED_CODE
        UnauthorizedError
      when HTTP_FORBIDDEN_CODE
        ForbiddenError
      when HTTP_NOT_FOUND_CODE
        NotFoundError
      when HTTP_UNPROCESSABLE_ENTITY_CODE
        UnprocessableEntityError
      else
        ApiError
      end
    end

    def response_successful?
      response.status == HTTP_OK_CODE
    end
  end
end