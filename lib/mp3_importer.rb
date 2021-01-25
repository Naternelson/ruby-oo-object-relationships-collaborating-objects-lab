class MP3Importer

    attr_accessor :path
    def initialize(filepath)
        self.path = filepath
    end

    def files 
        filenames = Dir.entries(self.path).grep(/^[\w\W]+(.mp3)$/)
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end