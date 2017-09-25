module Supports
  class Relationship
    def songs
      @songs = Song.all.collect { |song| [song.name, song.id] }
    end

    def categories
      @categories = Category.all.collect do |category|
        [category.name, category.id]
      end
    end

    def authors
      @authors = Author.all.collect { |author| [author.name, author.id] }
    end

    def singers
      @singers = Singer.all.collect { |singer| [singer.name, singer.id] }
    end

    def albums
      @albums = Album.all.collect { |album| [album.name, album.id] }
    end
  end
end
