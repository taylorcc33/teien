# frozen_string_literal: true

require 'spec_helper'
require 'redcarpet'
require 'front_matter_parser'
require 'pry'

describe ::Teien::Interpreter do
  describe '#interpret_files' do
    let(:interpreter) { ::Teien::Interpreter.new }
    let(:renderer) { Redcarpet::Render::HTML.new }
    let(:markdown) { Redcarpet::Markdown.new(renderer, extensions = {}) }
    let(:formatted_files) do
      [
        content: "# Second h1 tag\n\n## Second h2 tag\n\nThis is some **bold text**.",
        front_matter: { 'title' => 'Second Test Page', 'file_name' => 'test2', 'author' => 'Taylor Collins',
                        'date' => '09-10-2022' }
      ]
    end
    let(:interpreted_files) do
      [
        content: "<h1>Second h1 tag</h1>\n\n<h2>Second h2 tag</h2>\n\n<p>This is some <strong>bold text</strong>.</p>\n",
        front_matter: { 'title' => 'Second Test Page', 'file_name' => 'test2', 'author' => 'Taylor Collins',
                        'date' => '09-10-2022' }
      ]
    end

    it 'returns an array of html strings and frontmatter hashes' do
      interpreter.interpret_files(formatted_files)

      expect(interpreter.interpret_files(formatted_files)).to eq(interpreted_files)
    end
  end
end
