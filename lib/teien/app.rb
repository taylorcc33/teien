 # frozen_string_literal: true

module Teien
  class App
    def self.update
      parser = Parser.new
      generator = Generator.new

      parsed_files = parser.parse_files(parser.files)
    end
  end
end
