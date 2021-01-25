require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        self.name = name
        self.class.all << self
    end
    def self.all
        @@all
    end
    def artist_name=(name)
        artist_instance = Artist.all.find {|artist| artist.name == name}
        # binding.pry
        if artist_instance != nil 
            self.artist = artist_instance
        else
            artist_instance = Artist.new(name)
            self.artist = artist_instance
        end
    end

    def self.new_by_filename(file_name)
        foo = file_name.split(" - ")
        song = Song.new(foo[1])
        song.artist_name = foo[0]
        song
    end
end