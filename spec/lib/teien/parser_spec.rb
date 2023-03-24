require 'spec_helper'
require 'front_matter_parser'

describe ::Teien::Parser do
  describe '#parse_files' do
    let(:parser) { ::Teien::Parser.new }
    let(:file_names) { ['test1.md', 'test2.md'] }

    it 'calls formatted_parsed_files with correct' do
      parser.parse_files(file_names)

      expect(parser).to receive(:parse_files).with(file_names)
    end
  end
end


# Move some stuff from parser to app -
#   files ✅
#   markdown_path ✅
#   markdown_files ✅

# There's some hardcoded stuff, like the markdown file path. These values could be put in a config module or something to be pulled in at app level so the values are available across the app.
