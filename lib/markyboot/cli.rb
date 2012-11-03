require 'thor'
require 'markyboot'

module Markyboot
  class CLI < Thor

    desc "preview FILE", "Convert a Markdown document and open it in the default browser."
    def preview(file = nil)
      raise "No file specified" if file.nil?

      content = File.read(file)
      html = Markyboot::Document.new(content).render

      begin
        preview = File.new('/tmp/preview.html', 'w')
        preview.write html
        system %Q{open #{preview.path}}
        puts "#{preview.path} opened in browser."
      ensure
        preview.close
      end
    end

  end
end

