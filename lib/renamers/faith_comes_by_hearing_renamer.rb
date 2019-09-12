require_relative 'base_renamer'

class FaithComesByHearingRenamer < BaseRenamer
  def new_name(file, params)
    book, chapter = file.name \
      .gsub(/^[AB]\d{2}___/, '')
      .gsub(/_*[0-9A-Z]+\.mp3/, '')
      .split(/_/).reverse
    "#{target.path}/#{indexer.next}_#{params.name}_#{book}_#{chapter.to_i}.mp3"
  end
end