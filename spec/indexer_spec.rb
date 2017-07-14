require './lib/indexer'

describe Indexer do
  let(:indexer) { described_class.new }
  context 'new' do
    it 'foo'do
      expect(indexer.next).to eq('0000')
    end
  end
end
