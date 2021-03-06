class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
  self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ?  find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  # song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
  # song.name #=> "Blank Space"
  # song.artist_name #=> "Taylor Swift"

  def self.new_from_filename(filename)
    row = filename.split(" - ")
    artist_name = row[0]
    data = row[1].split(".")
    name = data[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
