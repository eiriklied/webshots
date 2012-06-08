# not automated tests. Just a helper script to run webshots for manual testing
require './lib/webshots'

# Run webshots without fethcing anything from the internet
Webshots.mode = :test
Webshots::Processor.url_to_png 'asdasd'