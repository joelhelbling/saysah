require_relative 'base_library'

class TargetLibrary < BaseLibrary
  def initialize
    @path = ENV["MEDIA_TARGET_PATH"]
  end
end