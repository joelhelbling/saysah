class BaseRenamer
  attr_reader :target, :indexer

  def initialize(target, indexer)
    @target = target
    @indexer = indexer
  end

  def new_name(file, params)
    "#{target.path}/#{indexer.next}_#{file.name}"
  end
end