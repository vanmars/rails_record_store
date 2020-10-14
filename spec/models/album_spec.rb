require 'rails_helper'

describe Album do
  # Old boilerplate, tedious method
  # it("has many songs") do
  #   album = Album.create(name: "album")
  #   song1 = Song.create(name: "song1", album_id: album.id)
  #   song2 = Song.create(name: "song2", album_id: album.id)
  #   expect(album.songs()).to(eq([song1, song2]))
  # end

  # Check One-to-Many Relationship with Songs
  it { should have_many(:songs) }
  it { should have_and_belong_to_many :artists }
  
  # Validations
  it { should validate_presence_of :name}
  it { should validate_length_of(:name).is_at_most(100) }

  # Callbacks
  it("titleizes the name of an album") do
    album = Album.create({name: "giant steps", genre: "jazz"})
    expect(album.name()).to(eq("Giant Steps"))
  end
end