require_relative 'base_renamer'

class AudibleNIVRenamer < BaseRenamer
  def new_name(file, params)
    ac = audible_chapter(file.name)
    bac = book_and_chapter(ac)
    "#{target.path}/#{indexer.next}_#{params.name}_#{bac}.mp3"
  end

  def audible_chapter(filename)
    filename.match(/Chapter (\d+)\.mp3$/)[1].to_i
  end

  def book_and_chapter(audible_chapter)
    current_book = []
    book_chapters = 0
    collected_books = books.take_while do |book|
      current_book = book
      book_chapters += current_book[1]
      book_chapters < audible_chapter
    end

    chapter_delta = collected_books.reduce(0) {|sum, book| sum + book[1] }
    "#{current_book[0]}_#{audible_chapter - chapter_delta}"
  end

  def books
    @books ||= [
      ["Genesis", 50],
      ["Exodus",  40],
      ["Leviticus", 27],
      ["Numbers", 36],
      ["Deuteronomy", 34],
      ["Joshua", 24],
      ["Judges", 21],
      ["Ruth", 4],
      ["1Samuel", 31],
      ["2Samuel", 24],
      ["1Kings", 22],
      ["2Kings", 25],
      ["1Chronicles", 29],
      ["2Chronicles", 36],
      ["Ezra", 10],
      ["Nehemiah", 13],
      ["Esther", 10],
      ["Job", 42],
      ["Psalms", 150],
      ["Proverbs", 31],
      ["Ecclesiastes", 12],
      ["SongofSongs", 8],
      ["Isaiah", 66],
      ["Jeremiah", 52],
      ["Lamentations", 5],
      ["Ezekiel", 48],
      ["Daniel", 12],
      ["Hosea", 14],
      ["Joel", 3],
      ["Amos", 9],
      ["Obadiah", 1],
      ["Jonah", 4],
      ["Micah", 7],
      ["Nahum", 3],
      ["Habakkuk", 3],
      ["Zephaniah", 3],
      ["Haggai", 2],
      ["Zechariah", 14],
      ["Malachi", 4],
      ["Matthew", 28],
      ["Mark", 16],
      ["Luke", 24],
      ["John", 21],
      ["Acts", 28],
      ["Romans", 16],
      ["1Corinthians", 16],
      ["2Corinthians", 13],
      ["Galatians", 6],
      ["Ephesians", 6],
      ["Philippians", 4],
      ["Colossians", 4],
      ["1Thess", 5],
      ["2Thess", 3],
      ["1Timothy", 6],
      ["2Timothy", 4],
      ["Titus", 3],
      ["Philemon", 1],
      ["Hebrews", 13],
      ["James", 5],
      ["1Peter", 5],
      ["2Peter", 3],
      ["1John", 5],
      ["2John", 1],
      ["3John", 1],
      ["Jude", 1],
      ["Revelation", 22]
    ]
  end
end
