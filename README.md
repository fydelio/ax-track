# AxTrack API Ruby Wrapper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/axTrack`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Open questions
* how do I know what type of sensors are available.

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
### Configure the client
The Gem is configured by default to work with the public platform of Adnexo at
* API: `https://prod.api.ax-track.ch/api/v1`
* User Interface: `https://app.ax-track.ch/#/map/assets/`

If you want the gem to use a different URL, create a file in the initializer folder
```ruby
# folder: `config/initializers/ax-track.rb`
AxTrack.set_base_url_api = 'NEW API URL'
AxTrack.set_base_url_user = 'NEW USER URL'
```

If you want to test which URL is configures, you can
```ruby
AxTrack.base_url_api
=> "https://prod.api.ax-track.ch/api/v1"
AxTrack.base_url_user
=> "https://app.ax-track.ch/#/map/assets/"
```

### Instantiate a client
```ruby
client = AxTrack::Client.new(api_key: your_api_key)
# Or if you have a ENV['AXTRACK_API_KEY'] set, you don't need to pass in the api key.
client = AxTrack::Client.new
```

### Trackers
```ruby
# Get a list of all trackers
client.tracker.list

# Get the specific information of a specific tracker. If :asset_id is invalid, a AxTrack::Resource::NotFoundError is returned
record = client.tracker.retrieve(:tracker_id)
```

You will receive an object AxTrack::Tracker (or a collection for the list call), where you can comfortably access each value
```ruby
record.asset_id
=> 1361
# The name on asset_id
record.name
=> #Name of asset on AxTrack#
record.identifier
=> "70B3D57050006F3B"
record.model
=> "dm-oyster"

# To access any asset details directly on the tracker just do
record.asset_details

# To get an array with all sensors
record.available_sensor_data
 => ["gps", "temperature", "battery", "humidity"]
```


### Assets
```ruby
# Get a list of all assets
client.asset.list

# Get a specific asset. If :asset_id is invalid, a AxTrack::Resource::NotFoundError is returned
client.asset.retrieve(:asset_id)

# Update a specif asset
client.asset.update(:tracker_id, params)
#t Example: to update the name
client.tracker.update(:tracker_id, name: 'New name')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To test the application in the console
```ruby
client = AxTrack::Client.new(api_key: _YOUR_API_KEY_)
# to get a list of all trackers (just as an example)
client.trackers
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/axTrack.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Open development
* Pagination for development


