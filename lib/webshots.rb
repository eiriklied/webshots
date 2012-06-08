require "webshots/version"
require "webshots/processor"

module Webshots

  # get an executable for the platform we are on
  # only tested on mac and heroku
  def self.executable
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

  def self.mode=(mode)
    @mode = mode.to_s
  end
  def self.mode
    @mode
  end
end
