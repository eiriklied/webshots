module Webshots
  class Processor

    # returns a path to a tmpfile containing a png with a screenshot
    def self.url_to_png(url, options_param={})
      raise "no url given" unless url

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

  end
end