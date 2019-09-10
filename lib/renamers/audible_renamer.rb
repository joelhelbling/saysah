class AudibleRenamer < BaseRenamer
  def new_name(file, params)
    chapter = file.name.match(/^.*Chapter (\d+).*$/)[1]
    "#{target.path}/#{indexer.next}_#{params.name}_Chapter_#{chapter}.mp3"
  end
end