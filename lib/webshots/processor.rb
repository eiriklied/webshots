require 'fileutils'
require 'tempfile'

module Webshots
  class Processor

    # returns a path to a tmpfile containing a png with a screenshot
    def self.url_to_png(url, options_param={})
      raise "no url given" unless url

      return test_file if Webshots.mode == 'test'

      default_options = {'crop-h' => 768, 'crop-w' => 1024, 'height' => 768, 'width' => 1024}
      options = default_options.merge(options_param)

      options_str = str_from_options(options)

       # Need to create a temporary file with a png extension that wkhtmltoimage can write to
      @tmp_file_path = File.join(File.dirname(Tempfile.new('screenshot')), rand_str) + '.png'
      
      cmd = "#{Webshots.executable} #{options_str} #{url} #{@tmp_file_path}"
      system(cmd)

      @tmp_file_path
    end

    private

    def self.rand_str(len=20)
      rand(36**len).to_s(36)
    end

    def self.str_from_options(options={})
      str = ''
      options.each do |key,val|
        str << "--#{key} #{val} "
      end
      str
    end

    # sometimes we want to run fast tests and not go out on the internet to fetch
    # a url
    def self.test_file
      @tmp_file_path = File.join(File.dirname(Tempfile.new('screenshot')), rand_str) + '.png'
      @static_file_path = File.absolute_path(File.join(File.dirname(__FILE__), '..', '..', 'files', '1024x768.png'))
      FileUtils.cp @static_file_path, @tmp_file_path
      @tmp_file_path
    end

  end
end