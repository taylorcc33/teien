require "spec_helper"

describe ::Teien::Parser do
  describe "#parse_files" do
    let(:app) { ::Teien::App.new }
    let(:parser) { ::Teien::Parser.new }
    let(:file_names) { ["test1.md", "test2.md"] }

    before do
      # allow(app).to receive(:parsed_files).with(file_names)
      allow(parser).to receive(:parsed_files).with(any_args).and_return(file_names)
    end

    it "receives files in correct format of array of strings" do
      expect(parser).to receive(:parse_files).with(file_names)
    end
  end
end


# Move some stuff from parser to app -
#   files 
#   markdown_path
#   markdown_files
