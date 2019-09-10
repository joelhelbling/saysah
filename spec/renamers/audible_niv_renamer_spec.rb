require './spec/spec_helper'
require './lib/renamers/audible_niv_renamer'

describe AudibleNIVRenamer do
  subject { described_class.new :fake_target, :fake_indexer }

  describe '#book_and_chapter' do
    it 'gets Genesis 1' do
      expect(subject.book_and_chapter(1)).to eq("Genesis_1")
    end

    it 'gets Genesis 2' do
      expect(subject.book_and_chapter(2)).to eq("Genesis_2")
    end

    it 'gets Exodus 1' do
      expect(subject.book_and_chapter(51)).to eq("Exodus_1")
    end

    it 'gets Exodus 40' do
      expect(subject.book_and_chapter(90)).to eq("Exodus_40")
    end

    it 'gets Leviticus 1' do
      expect(subject.book_and_chapter(91)).to eq("Leviticus_1")
    end

    it 'gets Revelation 1' do
      expect(subject.book_and_chapter(1168)).to eq("Revelation_1")
    end

    it 'gets Revelation 22' do
      expect(subject.book_and_chapter(1189)).to eq("Revelation_22")
    end
  end
end