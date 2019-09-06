require 'dotenv/load'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc "clear all symbolic links"
task :reset do
  require './lib/library_resetter'

  LibraryResetter.new.process
end

task :load_index do
  require 'mother'

  @index = Mother.create './index.yaml'
end

task :load_renamers do
  require_relative 'lib/renamers/base_renamer'

  Dir['./lib/renamers/*.rb'].each do |renamer|
    next if renamer.match(/base_renamer/)
    require renamer.gsub(/\.rb$/, '')
  end
end

desc "build symbolic link library (does reset)"
task :build => [:reset, :load_index, :load_renamers] do
  require './lib/library_builder'

  LibraryBuilder.new.process @index
end