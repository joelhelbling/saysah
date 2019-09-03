class Indexer
  def initialize initial_index=0
    @index = initial_index - 1
  end

  def next
    @index += 1
    render
  end

  def render
    @index.to_s.rjust(4, '0')
  end
end
