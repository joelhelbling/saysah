require_relative 'target_library'

class LibraryResetter
  attr_reader :target

  def initialize(opts)
    @dry_run = opts[:dry_run]
    @target = TargetLibrary.new
  end

  def process
    target.files.each do |file|
      `rm -f "#{file}"` unless dry_run?
      puts "Removed #{file}"
    end
  end

  private

  def dry_run?
    @dry_run
  end
end