# frozen_string_literal: false

module Teien
  # Generates the html files in the dist folder after the parsed markdown is interpreted into html.
  class Generator
    attr_reader :html_template, :navbar
    attr_accessor :navbar_list

    def initialize
      @html_template = File.read('templates/basic_temp.html')

      @navbar_list = ''

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
    # rubocop:disable Metrics/AbcSize
    def generate_html_files(files)
      # Clear out old html files before generating new ones
      delete_html_files

      # Loop over files and add navbar list items to navbar_list
      create_navbar_list(files)

      # Loop over files and generate html files from file[:content] and navbar_list
      files.map do |file|
        new_html = html_template.gsub(/<!-- CONTENT -->/, file[:content])
        new_html = new_html.gsub(/<!-- TITLE -->/, file[:front_matter]['title'])
        new_html = new_html.gsub(/<!-- NAV -->/, generate_navbar(navbar_list))

        file_name = file[:front_matter]['file_name'] || file[:front_matter]['title'].downcase.split(' ').join('-')

        File.open("dist/#{file_name}.html", 'w') { |f| f.write new_html }
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def delete_html_files
      Dir['dist/*.html'].each do |file|
        File.delete(file)
      end
    end

    def create_navbar_list(files)
      files.map do |file|
        next if file[:front_matter]['nav_location'] == ''

        nav_item = file[:front_matter]['title']

        nav_link = file[:front_matter]['file_name'] || file[:front_matter]['title'].downcase.split(' ').join('-')

        navbar_list << "<li><a href=\"#{nav_link}.html\">#{nav_item}</a></li>"
      end
    end

    # TODO: generate dynamic navbar like 100r site nav
    def generate_navbar(navbar_list)
      <<-HEREDOC
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
