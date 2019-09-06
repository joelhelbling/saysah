require_relative 'media_file'

class BaseLibrary
  attr_reader :path

  def initialize(path="./")
    @path = path
  end

  def last
    if files.any?
      files.last.index + 1
    else
      1
    end
  end

  def files
    @files ||= Dir["#{path}/*.mp3"].sort.map{|f| MediaFile.new f }
  end
end