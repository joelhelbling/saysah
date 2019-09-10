require_relative 'source_library'
require_relative 'target_library'
require_relative 'indexer'

require 'pry'

class LibraryBuilder
  attr_reader :source, :target, :indexer

  def initialize(opts)
    @dry_run = opts[:dry_run]
    @target = TargetLibrary.new
    @source = SourceLibrary.new
    @indexer = Indexer.new target.last
  end

  def process(index)
    index.each do |series|
      process_directory series
    end
  end

  private

  def dry_run?
    @dry_run
  end

  def process_directory(params)
    renamer = eval(params.renamer).new(target, indexer)
    source = SourceLibrary.new params.path
    source.files.each do |file|
      process_file(file, params, renamer)
    end
  end

  def process_file(file, params, renamer)
    target_filename = renamer.new_name(file, params)
    `ln -s "#{file}" "#{target_filename}"` unless dry_run?
    puts "\"#{file}\" -> \"#{target_filename}\""
  end
end