class Supports::Relationship
  def songs
    @songs = Song.all.collect {|song| [song.name, song.id]}
  end

  def categories
    @categories = Category.all.collect {|category| [category.name, category.id]}
  end

  def authors
    @authors = Author.all.collect {|author| [author.name, author.id]}
  end

  def singers
    @singers = Singer.all.collect {|singer| [singer.name, singer.id]}
  end
end
