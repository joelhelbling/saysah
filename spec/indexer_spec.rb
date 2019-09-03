require './lib/indexer'

describe Indexer do
  context 'new' do
    let(:indexer) { described_class.new }

    it 'starts with 0000' do
      expect(indexer.next).to eq('0000')
    end

    it 'increments' do
      indexer.next
      expect(indexer.next).to eq('0001')
    end
  end

  context 'new with starting number' do
    let(:indexer) { described_class.new 2 }

    it 'starts with 0002' do
      expect(indexer.next).to eq('0002')
    end
  end
end
