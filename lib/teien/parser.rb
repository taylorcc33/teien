# frozen_string_literal: true

module Teien
  class Parser
    attr_reader :parsed_files
    
    def initialize
      @files = markdown_files
    end

    def markdown_path
      path = 'markdown' if Dir.exist?('markdown')
    end

    def markdown_files
      files = Dir.entries(markdown_path)
      files.delete('.')
      files.delete('..')
      files
    end

    def parse_markdown_file(file)
      parsed = FrontMatterParser::Parser.parse_file("#{markdown_path}/#{file}")
    end

    def parse_files(files)
      parsed_files = []

      files.each do |file|
        parsed = parse_markdown_file(file)
        parsed_files << parsed
      end
    end

    
  end
end



# Return of parse_files:
# [
#   {
#     front_matter: "This is the front matter",
#     content: "This is the html content"
#   },
#   {
#     front_matter: "This is the front matter",
#     content: "This is the html content"
#   },
# ]
