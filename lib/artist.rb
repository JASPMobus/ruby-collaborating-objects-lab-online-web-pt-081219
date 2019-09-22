class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    
    @@all << self 
  end
  
  def self.all 
    @@all 
  end 
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    artist = @@all.find { |artist| artist.name == name }
    artist ? artist : Artist.new(name)
  end 
  
  def print_songs
    @songs.uniq.each do |song|
      puts song.name
    end
  end 
end 