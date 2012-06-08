# Webshots

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'webshots'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webshots

## Usage
  
### Really simple usage: 

    require 'webshots'
    @png_file = Webshots::Processor.url_to_png 'http://www.google.com'

### When running integration tests

If you don't want your integration tests to always fetch an image from the internet because its slow or you don't have a connection, you can set Webshots mode to 'test'. This will cause Webshots to always return a static image with dimensions 1024x768 from http://placehold.it

    # Rails example: create a file config/initializers/webshots.rb
    # The code below will cause Webshots to deliver a static image in test mode
    Webshots.mode = Rails.env

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
