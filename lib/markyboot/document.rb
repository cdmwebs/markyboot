require 'redcarpet'

module Markyboot 
  class HTMLwithAlbino < Redcarpet::Render::HTML; end

  class Document
    attr_accessor :html

    def initialize(contents)
      marker = Redcarpet::Markdown.new(HTMLwithAlbino, :fenced_code_blocks => true)
      @html = marker.render(contents)
    end

    def layout
      layout = <<-HTML.gsub(/^ {6}/, '')
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <title>Preview</title>
          <meta charset="utf-8">
          <link rel="stylesheet" href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" />
          <link rel="stylesheet" href="http://yandex.st/highlightjs/6.1/styles/zenburn.min.css" />
          <style type="text/css">
            body {
              background-color: #eee;
            }
            .container {
              background-color: #fff;
              width: 650px;
              margin: 2em auto;
              padding: 2em;
            }
            pre code.ruby {
              line-height: 1.45em;
            }
          </style>
        </head>
        <body>
          <div class="container">
            REPLACE_ME
          </div>
          <script src="http://yandex.st/highlightjs/6.1/highlight.min.js"></script>
          <script>hljs.initHighlightingOnLoad();</script>
        </body>
      </html>
      HTML
      layout
    end

    def render
      layout.gsub(/REPLACE_ME/, @html)
    end
  end
end

