class Teien
  # ✅ get path to markdown directory
  # ✅ load markdown files from directory
  #  


  def gen
    files = markdown_files
    front_matter = parse_frontmatter(files)
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

  def parse_frontmatter(file)
    parsed = FrontMatterParser::Parser.parse_file(file[0])   
  end
end

