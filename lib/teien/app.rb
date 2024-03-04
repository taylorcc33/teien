# frozen_string_literal: true

module Teien
  # The App class serves as the central orchestrator for the Teien application, bridging together
  # the core components: Parser, Interpreter, and Generator. It manages the lifecycle of converting
  # markdown files from a specified markdown directory into HTML files in an HTML directory.
  #
  # Responsibilities include:
  # - Managing the collection of markdown files within the markdown directory.
  # - Utilizing the Parser to extract content and metadata from markdown files.
  # - Leveraging the Interpreter to process and transform parsed data.
  # - Employing the Generator to create HTML files from interpreted data, updating the HTML directory.
  #
  # This class is designed to be instantiated with optional custom instances of Parser, Generator,
  # and Interpreter, allowing for flexible configuration of the processing pipeline. The #update
  # method triggers the conversion process, reflecting any changes in the markdown source files
  # into the corresponding HTML outputs.
  #
  class App
    attr_reader :parser, :interpreter, :generator, :markdown_files

    def initialize(parser = Parser.new, generator = Generator.new, interpreter = Interpreter.new)
      @parser = parser
      @generator = generator
      @interpreter = interpreter
      @markdown_files = Dir.children(markdown_path)
    end

    def update
      generator.generate_html_files(interpreted_files)
    end

    private

    # returns parsed files into html strings
    def interpreted_files
      interpreter.interpret_files(parsed_files)
    end

    # returns content and frontmatter strings from markdown files
    def parsed_files
      parser.parse_files(markdown_files)
    end

    def markdown_path
      'markdown' if Dir.exist?('markdown')
    end
  end
end
