# frozen_string_literal: true

module Teien
  class App
    def self.update
      generator = Generator.new
      parser = Parser.new

      generator.generate_html_files
    end
  end
end