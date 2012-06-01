require "webshots/version"

module Webshots
  def self.executable
    puts "Webshots: #{__FILE__}"
    executable_file =  case RUBY_PLATFORM
      when /linux/ # heroku
        'wkhtmltoimage-amd64'
      when /darwin/ # mac
        'wkhtmltoimage-OSX-10.0_rc2'
      else
        raise "No bundled binaries found for your system."
      end
    executable = File.absolute_path(File.join(File.dirname(__FILE__), '..', 'bin', executable_file))
  end
end
