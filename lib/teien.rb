class Teien
  # get path to markdown directory
  # load markdown files from directory
  #  


  def gen
    markdown_files
  end

  def markdown_path
    path = 'markdown' if Dir.exist?('markdown')
  end

  def markdown_files
    files = Dir.entries(markdown_path)
    files.delete(".")
    files.delete("..")
    files
  end
end

