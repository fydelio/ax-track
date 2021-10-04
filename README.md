# AxTrack

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/axTrack`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ax-track'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install axTrack

## Usage

```ruby
client == AxTrack::Client.new(api_key: your_api_key)
```

### Trackers
```ruby
# Get a list of all trackers
client.tracker.list

# Get the specific information of a specific tracker
client.tracker.retrieve(:tracker_id)
```

### Assets
```ruby
# Get a list of all assets
client.asset.list

# Get a specific asset
client.asset.retrieve(:asset_id)

# Update a specif asset
client.asset.update(:tracker_id, params)
#t Example: to update the name
client.tracker.update(:tracker_id, name: 'New name')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/axTrack.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Open development
* Pagination for development