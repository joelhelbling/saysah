class Indexer
  def initialize
    @index = -1
  end

  def next
    @index += 1
    render
  end

  def render
    @index.to_s.rjust(4, '0')
  end
end
