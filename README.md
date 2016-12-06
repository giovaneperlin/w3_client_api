# W3ClientAPI

Specific API for w3case clients

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'w3_client_api', git: 'https://github.com/luizpicolo/w3_client_api.git'
```
and run

```
rails g w3_client_api
```

Change configurations


```ruby
# config/initializers/w3_client_api.rb
W3ClientApi.configure do |config|
  # Config host
  config.host = '' # Host storage
  config.user = '' # User storage
  config.password = '' # password storage
  config.path = '' # Path files storage

  # Config database
  config.db = '' # Name database

  # API Key
  config.key = ''
end
```

## Tests

Change configuration

```ruby
W3ClientApi.configure do |config|
  # Config host
  config.host = 'localhost'
  config.user = 'w3_client_api'
  config.password = 'w3_client_api'
  config.path = '/home/w3_client_api/'

  # Config database
  config.db = 'w3_client_api_test'

  # API Key
  config.key = 'bffbad9f715467b94fe54'
end
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
