require_relative 'base_library'

class SourceLibrary < BaseLibrary
  def initialize(path=ENV["MEDIA_SOURCE_PATH"])
    @path = path
  end
end