require 'spec_helper'
require 'front_matter_parser'

describe ::Teien::Parser do
  describe '#parse_files' do
    let(:parser) { ::Teien::Parser.new }
    let(:file_names) { ['test1.md', 'test2.md'] }
    let(:frontmatter_object) { double('FrontMatterParser::Parsed') }
    let(:formatted_files) { [{ content: frontmatter_object.content, front_matter: frontmatter_object.front_matter }] }

    before do
      allow(FrontMatterParser::Parser).to receive(:parse_file).with("markdown/#{file_names[0]}").and_return(frontmatter_object)
      allow(FrontMatterParser::Parser).to receive(:parse_file).with("markdown/#{file_names[1]}").and_return(frontmatter_object)
      allow(parser).to receive(:formatted_parsed_files).with([frontmatter_object, frontmatter_object]).and_return([frontmatter_object, frontmatter_object])
    end

    it 'returns an array of formatted files' do
      parser.parse_files(file_names)

      expect(parser.parse_files(file_names)).to eq([frontmatter_object, frontmatter_object])
    end
  end
end


# Move some stuff from parser to app -
#   files ✅
#   markdown_path ✅
#   markdown_files ✅

# There's some hardcoded stuff, like the markdown file path. These values could be put in a config module or something to be pulled in at app level so the values are available across the app.

# parse_files return object is:

# [{:content=>
#    "# Second h1 tag\n\n## Second h2 tag\n\nThis is some **bold text**.\n\n1. Ordered item 1\n2. Ordered item 2\n3. Ordered item 3\n\n```\n# here is some code\ndef test\n  p \"test\"\nend\n```\n",
#   :front_matter=>{"title"=>"Second Test Page", "file_name"=>"test2", "author"=>"Taylor Collins", "date"=>"09-10-2022"}},
#  {:content=>"# This is an h1\n\n## This is an h2\n\nThis is a test paragraph for this page.\n",
#   :front_matter=>{"title"=>"Test Page", "file_name"=>"test", "author"=>"Taylor Collins", "date"=>"09-04-2022"}}]