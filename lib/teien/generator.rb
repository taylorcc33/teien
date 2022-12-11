# frozen_string_literal: true

module Teien
  # Generates the html files in the dist folder after the parsed markdown is interpreted into html.

  class Generator
    attr_reader :html_template

    def initialize
      @html_template = File.read("templates/basic_temp.html")
    end

    # takes html strings as content and frontmatter
    def generate_html_files(files)
      files.each do |file|
        binding.pry
      end
    end
  end   
end



# Load html_template in initializer - DONE!
# Map over files
# Insert content into html_template body
# Insert frontmatter into relevant header fields
# Save html file into relevant dist directory
