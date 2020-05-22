require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    # if artist != nil
    #   self.artist = artist
    # end
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
     @artist = artist
    artist.add_song(self)
  end

  def self.find_by_name(input)
    @@all.find {|s| s.name == input}
  end

  def self.find_or_create_by_name(input)
    found = self.find_by_name(input)
      found ? found : self.create(input)
    end

#     def self.find_or_create_by_name(input)
#   input = self.find_by_name(input) ? song : Song.new(input)
# end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @@all << self.new(name)
    @@all[-1]
  end

end
