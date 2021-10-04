module AxTrack
  class Collection
    attr_reader :data, :total, :next_cursor, :prev_cursor

    # key is the subset of the json_response for which to create an array
    # type is the class Type to wrap the results from key
    def self.from_response(json_response, key:, type: )
      body = json_response.body
      new(
        data: body[key].map { |attrs| type.new(attrs ) },
        total: body.dig('count'),
        next_cursor: body.dig('next'),
        prev_cursor: body.dig('previous')
      )
    end

    def initialize (data:, total:, next_cursor:, prev_cursor:)
      @data = data
      @total = total
      @next_cursor = next_cursor.nil? || next_cursor.empty? ? nil : next_cursor
      @prev_cursor = prev_cursor.nil? || prev_cursor.empty? ? nil : prev_cursor
    end

  end
end