class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    
    self.files
  end
  
  def files
    @files = Dir.entries(path).filter { |file| file.include?(".mp3") }
  end 
  
  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end 
  end
end