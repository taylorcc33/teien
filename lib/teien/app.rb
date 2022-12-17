 # frozen_string_literal: true

module Teien
  class App
    attr_reader :parser, :interpreter, :generator
    
    def initialize
      @parser = Parser.new
      @generator = Generator.new
      @interpreter = Interpreter.new

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
      parser.parse_files(parser.files)
    end
  end
end
