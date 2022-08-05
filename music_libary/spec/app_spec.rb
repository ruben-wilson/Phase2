require_relative "../app.rb"

RSpec.describe Application do 
  it "returns all albums when input chooses 1 for albums" do
    fake_album_repo = double(:fake_album_repo)
    fake_artist_repo = double(:fake_album_repo, all: "1 - Doolittle")
    kernel = double(:kernel)
    album = double :album
    expect(kernel).to receive(:puts).with("Welcome to the music library manager!")
    expect(kernel).to receive(:puts).with("What would you like to do?")
    expect(kernel).to receive(:puts).with("1 - List all albums")
    expect(kernel).to receive(:puts).with("2 - List all artists")   
    expect(kernel).to receive(:puts).with("[ENTER]") 
    expect(kernel).to receive(:gets).and_return(1) 
    expect(fake_album_repo).to receive(:all).and_return(album)
    expect(album).to receive(:each).and_return(album)
    app = Application.new('music_libary',kernel, fake_album_repo, fake_artist_repo )
    app.run
  end
  it "returns all artists when input chooses 2 for artist" do
    fake_album_repo = double(:fake_album_repo)
    fake_artist_repo = double(:fake_album_repo)
    kernel = double(:kernel)
    artist = double :artist
    expect(kernel).to receive(:puts).with("Welcome to the music library manager!")
    expect(kernel).to receive(:puts).with("What would you like to do?")
    expect(kernel).to receive(:puts).with("1 - List all albums")
    expect(kernel).to receive(:puts).with("2 - List all artists")   
    expect(kernel).to receive(:puts).with("[ENTER]") 
    expect(kernel).to receive(:gets).and_return(2) 
    expect(fake_artist_repo).to receive(:all).and_return(artist)
    expect(artist).to receive(:each).and_return(artist)
    app = Application.new('music_libary',kernel, fake_album_repo, fake_artist_repo )
    app.run
  end
end 