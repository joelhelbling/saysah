require_relative 'base_library'

class TargetLibrary < BaseLibrary
  def initialize
    @path = ENV["MEDIA_STAGING_PATH"]
    raise "You must provide a MEDIA_STAGING_PATH environment variable!" unless @path
  end
end