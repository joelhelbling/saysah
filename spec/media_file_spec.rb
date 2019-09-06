require 'spec_helper'
require './lib/media_file'

describe MediaFile do
  let(:full_path) { "/path/to/a_file.txt"}
  let(:subject) { described_class.new full_path }

  it "has a path" do
    expect(subject.path).to eq("/path/to")
  end

  it "has a name" do
    expect(subject.name).to eq("a_file.txt")
  end

  it "renders as a string" do
    expect(subject.to_s).to eq(full_path)
  end

  it "gsubs" do
    result = subject.gsub(/to/, 'at')
    expect(result).to eq("/path/at/a_file.txt")
  end

  context "when file contains an index" do
    let(:full_path) { "path/to/0023_a_file.txt" }
    let(:subject) { described_class.new full_path }

    it "returns the index" do
      expect(subject.index).to eq('0023')
    end
  end

  context "when file contains no index" do
    it "returns a '-'" do
      expect(subject.index).to eq('-')
    end
  end
end