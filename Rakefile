require 'dotenv/load'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc "clear all symbolic links"
task :reset => [:load_env] do
  require './lib/library_resetter'

  LibraryResetter.new(dry_run: @dry_run).process
end

desc "build symbolic link library (does reset)"
task :build => [:load_env, :reset, :load_index, :load_renamers] do
  require './lib/library_builder'

  LibraryBuilder.new(dry_run: @dry_run).process @index
end

task :load_env do
  require 'dotenv/load'
  @dry_run = ENV['DRY_RUN']
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