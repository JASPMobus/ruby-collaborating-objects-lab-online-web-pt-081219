class Song
  attr_accessor :name, :artist, :artist_name
  
  @@all = []
  
  def initialize(name)
    @name = name
    
    @@all << self 
  end 
  
  def artist=(artist)
    artist.songs << self
    @artist = artist
  end 
  
  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    @artist = artist
    @artist_name = artist_name
  end
  
  def self.new_by_filename(filename)
    info = filename.split(" - ")
    
    artist = Artist.new(info[0])
    name = info[1]
    
    new_song = Song.new(name)
    new_song.artist = artist
    
    @@all.push(new_song)
  end
  
  def self.all 
    @@all
  end
end