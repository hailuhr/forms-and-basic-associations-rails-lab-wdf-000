class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end


  # def note_contents
  #   self.try(:note).try(:content)
  # end



  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        self.notes << Note.find_or_create_by(content: note)
      end
    end

  end

  def note_contents
    array = []
    self.notes.map do |note|
      array << note.content
    end

    array
    # binding.pry
    # ids.each do |id|
    #   note = Note.find_by(id)
    #   self.notes << note
    # end
    # self.notes << Note.find_or_create_by(content: content)

    # self.notes.map do |note|
    #   note.content
    # end

  end

end
