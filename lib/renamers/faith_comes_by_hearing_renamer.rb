class FaithComesByHearingRenamer < BaseRenamer
  def new_name(file, params)
    chapter_verse = file.name \
      .gsub(/^[AB]\d{2}___/, '')
      .gsub(/_*#{params.removes}/, '')
    "#{target.path}/#{indexer.next}_#{params.name}_#{chapter_verse}"
  end
end