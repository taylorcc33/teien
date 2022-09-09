class Teien
  # ✅ get path to markdown directory
  # ✅ load markdown file from directory
  # parse frontmatter from file 

  def gen
    files = markdown_files
    parsed = parse(files)
    meta_data = parsed.front_matter
    body = parsed.content

    p parse_body(body)

  end

  def markdown_files
    files = Dir.entries(markdown_path)
    files.delete(".")
    files.delete("..")
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

