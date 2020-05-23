require 'pry'

class MusicLibraryController

 def initialize(path="./db/mp3s")
   MusicImporter.new(path).import
 end

 def call
   input = ''
   while input != 'exit'
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"
   input = gets.strip

   case input
   when 'list songs'
      list_songs
    when 'list artists'
      list_artists
    when 'list genres'
      list_genres
    when 'list artist'
      list_songs_by_artist
    when 'list genre'
      list_songs_by_genre
    when 'play song'
      play_song
    end
  end
 end

 def list_songs
   Song.all.sort{|a, b| a.name <=> b.name }.each_with_index do |e, i|
     puts "#{i+1}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
   end
 end

 def list_artists
   Song.all.sort{|a, b|
     binding.pry
     a.name <=> b.name }.each_with_index do |a, i|
     puts "#{i+1}.#{a.artist.name}"
   end
 end

 def list_genres
 end

 def list_songs_by_artist
 end

 def list_songs_by_genre
 end

 def play_song
 end

end
