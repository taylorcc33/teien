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
      delete_html_files
      
      html_files = files.map do |file|
        new_html = html_template.gsub(/<!-- CONTENT -->/, file[:content])
        new_html = new_html.gsub(/<!-- TITLE -->/, file[:front_matter]["title"])

        file_name = file[:front_matter]["title"].downcase.split(" ").join("-")

        File.open("dist/#{file_name}.html", 'w') { |f| f.write new_html }
      end
    end

    def delete_html_files
      Dir["dist/*.html"].each do |file|
        File.delete(file)
      end
    end
  end   
end



# Load html_template in initializer - DONE!
# Map over files - DONE!
# Insert content into html_template body - DONE!
# Insert frontmatter into relevant header fields - DONE!
# Save html file into relevant dist directory
