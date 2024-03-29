# frozen_string_literal: true

module Teien
  #   [{:content=>"<h1>Second h1 tag</h1>\n\n<h2>Second h2 tag</h2>\n\n<p>This is some <strong>bold text</strong>.</p>\n\n<ol>\n<li>Ordered item 1</li>\n<li>Ordered item 2</li>\n<li>Ordered item 3</li>\n</ol>\n\n<p>```</p>\n\n<h1>here is some code</h1>\n\n<p>def test<br>\n  p &quot;test&quot;<br>\nend<br>\n```</p>\n",
  #   :front_matter=>{"title"=>"Second Test Page", "file_name"=>"test2", "author"=>"Taylor Collins", "date"=>"09-10-2022"}},
  #  {:content=>"<h1>This is an h1</h1>\n\n<h2>This is an h2</h2>\n\n<p>This is a test paragraph for this page.</p>\n", :front_matter=>{"title"=>"Test Page", "file_name"=>"test", "author"=>"Taylor Collins", "date"=>"09-04-2022"}}]

  # The Teien module provides functionality for interpreting files and rendering them as HTML.
  class Interpreter
    attr_reader :files, :renderer, :markdown

    def initialize
      @renderer = Redcarpet::Render::HTML.new(no_links: false, hard_wrap: true)
      @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    end

    def interpret_files(files)
      files.each do |file|
        file[:content] = markdown.render(file[:content])
      end
    end
  end
end

# File.open('templates/basic_temp.html', 'w') { |f| f.write html_template }

# renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
# markdown = Redcarpet::Markdown.new(renderer, extensions = {})

# p markdown.render('This is *bongos*, indeed.')
