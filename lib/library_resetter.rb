require_relative 'target_library'

class LibraryResetter
  attr_reader :target

  def initialize
    @target = TargetLibrary.new
  end

  def process
    target.files.each do |file|
      `rm -f "#{file}"`
      puts "Removed #{file}"
    end
  end
end