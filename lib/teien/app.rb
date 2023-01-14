 # frozen_string_literal: true

module Teien
  class App
    attr_reader :parser, :interpreter, :generator, :markdown_files
    
    def initialize
      @parser = Parser.new
      @generator = Generator.new
      @interpreter = Interpreter.new
      @markdown_files = Dir.children(markdown_path)

    end

    def update
      generator.generate_html_files(interpreted_files)
    end

  private

    def interpreted_files
      interpreter.interpret_files(parsed_files)
    end

    # parses markdown files into content and frontmatter strings
    def parsed_files
      binding.pry
      parser.parse_files(markdown_files)
    end

    def markdown_path
      path = 'markdown' if Dir.exist?('markdown')
    end
  end
end
