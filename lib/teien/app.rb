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
      binding.pry
      generator.generate_html_files(interpreted_files)
    end

  private

    def interpreted_files
      binding.pry
      interpreter.interpret_files(parsed_files)
    end

    # pareses markdown files into content and frontmatter strings
    def parsed_files
      binding.pry
      parser.parse_files(parser.files)
    end
  end
end
