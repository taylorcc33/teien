# frozen_string_literal: true

# top level documentation comment
class Teien
  # ✅ get path to markdown directory
  # ✅ load markdown file from directory
  # ✅ parse frontmatter from file
  # ✅ parse html body from file
  # add html to teemplate in dist folder
  # loop to be handle multiple .md files

  def gen
    files = markdown_files
    parsed = parse(files)

    meta_data = parsed.front_matter

    html_body = parse_body(parsed.content)
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
    parsed = FrontMatterParser::Parser.parse_file("#{markdown_path}/#{file[0]}")
  end

  def parse_body(content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(content)
  end
end
