class Artist

    attr_accessor :name
    @@all = []
    def initialize(name)
        self.name = name
        @@all << self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        self.songs
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find {|artist| artist.name == name}
        if artist != nil
            return artist
        else
            artist = Artist.new(name)
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end
