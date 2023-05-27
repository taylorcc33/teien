# frozen_string_literal: false

module Teien
  # Generates the html files in the dist folder after the parsed markdown is interpreted into html.

  class Generator
    attr_reader :html_template, :navbar
    attr_accessor :navbar_list

    def initialize
      @html_template = File.read('templates/basic_temp.html')

      @navbar_list = ""

      # @navbar = {
      #   "dev": {
      #     "projects": {
      #       "teien": {},
      #       "death counter": {},
      #     },
      #     "programming": {
      #       "ruby": {
      #         "rails": {},
      #       },
      #       "javascript": {
      #         "react": {},
      #       },
      #       "c#": {},
      #     },
      #   },
      #   "games": {
      #     "reviews": {},
      #   },
      #   "music": {},
      #   "about": {
      #     "inventory": {},
      #     "personal": {},
      #   },
      # } 
    end

    # takes html strings as content and frontmatter
    def generate_html_files(files)
      delete_html_files

      # Loop over files and add navbar list items to navbar_list
      create_navbar_list(files)

      # Loop over files and generate html files from file[:content] and navbar_list
      html_files = files.map do |file|
        new_html = html_template.gsub(/<!-- CONTENT -->/, file[:content])
        new_html = new_html.gsub(/<!-- TITLE -->/, file[:front_matter]['title'])
        new_html = new_html.gsub(/<!-- NAV -->/, generate_navbar(navbar_list))
        file_name = ""

        if file[:front_matter]['file_name']
          file_name = file[:front_matter]['file_name']
        else
          file_name = file[:front_matter]['title'].downcase.split(' ').join('-')
        end

        File.open("dist/#{file_name}.html", 'w') { |f| f.write new_html }
      end
    end

    private   

    # Clears out old html files before generating new ones
    def delete_html_files
      Dir['dist/*.html'].each do |file|
        File.delete(file)
      end
    end

    def create_navbar_list(files)
      files.map do |file|
        nav_item = file[:front_matter]['title']
        
        if file[:front_matter]['file_name']
          nav_link = file[:front_matter]['file_name']
        else
          nav_link = file[:front_matter]['title'].downcase.split(' ').join('-')
        end

        navbar_list << "<li><a href=\"#{nav_link}.html\">#{nav_item}</a></li>"
      end
    end

    # TODO: generate dynamic navbar like 100r site nav
    def generate_navbar(navbar_list)
      navbar = <<-HEREDOC
      <summary>Menu</summary>
      <section class="site-nav">
        <section>
          <ul class="nobull capital">
            #{navbar_list}
          </ul>
        </section>
      </section>
      HEREDOC
    
    end
  end
end
