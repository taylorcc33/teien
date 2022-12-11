# frozen_string_literal: true

module Teien
  # Parses markdown files with FrontMatterParser into array of FrontMatterParser objects:
  #
  # <FrontMatterParser::Parsed:0x00007f97a408b180
  # @content="# Second h1 tag\n\n## Second h2 tag\n\nThis is some **bold text**.\n\n1. Ordered item 1\n2. Ordered item 2\n3. Ordered item 3\n\n```\n# here is some code\ndef test\n  p \"test\"\nend\n```\n",
  # @front_matter={"title"=>"Second Test Page", "author"=>"Taylor Collins", "date"=>"09-10-2022"}>
  #
  # Access @content and @front_matter with . methods -> parsed_files[0].content

  class Parser
    attr_accessor :files, :parsed_files
   
    def initialize
      @files = markdown_files
    end
   
    def parse_files(files)
      parsed_files = []

      files.each do |file|
        parsed = parse_markdown_file(file)
        parsed_files << parsed
      end

      formatted_parsed_files(parsed_files)
    end

  private

    def markdown_path
      path = 'markdown' if Dir.exist?('markdown')
    end

    def markdown_files
      files = Dir.children(markdown_path)
      # files
    end

    def parse_markdown_file(file)
      parsed = FrontMatterParser::Parser.parse_file("#{markdown_path}/#{file}")
    end

    def formatted_parsed_files(files)
      formatted_files = []

      files.each do |file|
        file_object = {}

        file_object[:content] = file.content
        file_object[:front_matter] = file.front_matter

        formatted_files << file_object
      end

      formatted_files
    end
  end
end
