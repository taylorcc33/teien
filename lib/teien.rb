# frozen_string_literal: true

require_relative 'teien/parser'
require_relative 'teien/app'
require_relative 'teien/generator'
# top level documentation comment
module Teien
  # ✅ get path to markdown directory
  # ✅ load markdown file from directory
  # ✅ parse frontmatter from file
  # ✅ parse html body from file
  # -  add html to template in dist folder
  # -  get html template
  # -  sub out content tag with parsed html content.
  #
  #
  #
  #
  # loop to be handle multiple .md files

  def generate_html_files
    files = markdown_files
    parsed_files = []

    files.each do |file|
      parsed = parse(file)
      parsed_files << parsed
    end

    # meta_data = parsed.front_matter

    # html_body = parse_body(parsed.content)
  end

  def markdown_files
    files = Dir.entries(markdown_path)
    files.delete('.')
    files.delete('..')
    files
  end

  def markdown_path
    path = 'markdown' if Dir.exist?('markdown')
  end

  def parse(file)
    parsed = FrontMatterParser::Parser.parse_file("#{markdown_path}/#{file}")
  end

  def parse_body(content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(content)
  end

  def html_template
    template = File.read("templates/basic_temp.html")
  end
end
