require 'spec_helper'

::RSpec.describe ::Teien::Generator do
  let(:generator) { ::Teien::Generator.new }
  let(:html_files) do
    [
      {
        content: '<p>Hello World</p>',
        front_matter: {
          'title' => 'Test Title',
          'nav_location' => 'dev/projects/teien'
        }
      }
    ]
  end


  describe "#initialize" do
    it "loads the html template" do
      expect(generator.html_template).to include("<!-- CONTENT -->")
    end
  end

  describe "#generate_html_files" do
    before do
      generator.generate_html_files(html_files)
    end

    after do
      File.delete('dist/test-title.html') if File.exist?('dist/test-title.html')
    end

    it "creates the expected html file in the dist folder" do
      expect(File.exist?('dist/test-title.html')).to be true
    end

    it "inserts the title into the html file" do
      file_content = File.read('dist/test-title.html')
      expect(file_content).to include('Test Title')
    end

    it "inserts the content into the html file" do
      file_content = File.read('dist/test-title.html')
      expect(file_content).to include('<p>Hello World</p>')
    end

    it "inserts the navbar into the html file" do
      file_content = File.read('dist/test-title.html')
      expect(file_content).to include('<summary>Menu</summary>')
    end
  end

  describe "#delete_html_files" do
    before do
      File.open('dist/temp-file.html', 'w') { |f| f.write("Temp file") }
      generator.send(:delete_html_files)
    end

    after do
      File.delete('dist/temp-file.html') if File.exist?('dist/temp-file.html')
    end

    it "deletes all html files in the dist folder" do
      expect(Dir['dist/*.html']).to be_empty
    end
  end
end
