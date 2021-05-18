class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #! NOTE TO SELF: THIS IS A TERNARY OPERATOR EXPRESSION! (a syntactic sugar for conditional)
  def artist_name
    self.artist ? self.artist.name : nil
  end

  # ! SAME AS.....
  # def artist_name 
  #   if self.artist
  #     self.artist.name
  #   else 
  #     nil
  #   end
  # end
  def note_contents=(contents)
    new_note = self
    contents.each do |c|
      new_note = Note.find_or_create_by(content: c)
      self.notes << new_note
    end
  end

end
