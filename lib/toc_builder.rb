require_relative 'target_library'
require 'legitable'

class TOCBuilder
  attr_reader :target

  def initialize(opts)
    @dry_run = opts[:dry_run]
    @target = TargetLibrary.new
  end

  def build
    puts tabularize(make_columns)
  end

  private

  def build_collection
    current_book = ''
    target.files.map do |file|
      name_parts = file.name.split(/_/)
      name_parts.shift
      name_parts.pop
      name_parts.pop if name_parts.last == "Chapter"
      name_parts.pop if name_parts.last.match(/p\d+/)
      this_book = name_parts.join(" ")
      if this_book != current_book
        current_book = this_book
        index = file.index.gsub(/^0+/, '').rjust(4, ' ')
        "#{index} - #{this_book}"
      end
    end.compact
  end

  def make_columns
    collection = build_collection
    number_of_columns = 3
    remainder = (collection.count % number_of_columns)
    default_column_length = (collection.count - remainder) / number_of_columns
    column3_size = default_column_length
    column2_size = default_column_length + (remainder > 1 ? 1 : 0)
    column1_size = default_column_length + (remainder > 0 ? 1 : 0)
    [column1_size, column2_size, column3_size].map do |size|
      [].tap do |column|
        size.times { column << collection.shift }
      end
    end
  end

  def tabularize(columns)
    table = Legitable::Table.new(delimiter: '      ')
    last_col_index = columns[0].size - 1
    (0..last_col_index).each do |i|
      table << {COL_A: columns[0][i], COL_B: columns[1][i], COL_C: columns[2][i]}
    end

    table.to_s
  end

  def dry_run?
    @dry_run
  end
end