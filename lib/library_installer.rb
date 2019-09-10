require_relative 'target_library'

class LibraryInstaller
  attr_reader :target, :install_base, :install_path

  def initialize(opts)
    @dry_run = opts[:dry_run]
    @target = TargetLibrary.new
    @install_base = ENV['SD_MEDIA_PATH']
    @install_path = "#{install_base}/Music/"
  end

  def process
    ensure_install_path
    if dry_run?
      target.files.each do |file|
        puts "#{file} -> #{install_path}"
      end
    else
      exec "cp -v --no-clobber --dereference #{target.path}/*.mp3 #{install_path}"
    end
  end

  private

  def ensure_install_path
    if install_base.nil?
      raise "You must define environment variable SD_MEDIA_PATH!!!"
    end
    unless Dir.exist?(install_base)
      raise "Install media path not found! (#{install_base})"
    end
    unless Dir.exist?(install_path)
      `mkdir #{install_path}`
    end
  end

  def dry_run?
    !! @dry_run
  end
end