class MediaFile
  attr_reader :path, :name

  def initialize(full_path)
    @path = File.dirname(full_path)
    @name = full_path.gsub(/^#{@path}\/?/, '')
  end

  def to_s
    "#{path}/#{name}"
  end

  def gsub(pattern, replacement)
    to_s.gsub(pattern, replacement)
  end

  def index
    matches = name.match(/^(\d{4})_/)
    matches ? matches[1] : '-'
  end
end