require "AlbumRepository"

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_libary_test' })
  connection.exec(seed_sql)
end

RSpec.describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

  it "returns all lines in database to album objects correctly" do 
    
    repo =  AlbumRepository.new 

    albums = repo.all

    expect(albums[0].title).to eq 'DAMN'
    expect(albums[0].release_year).to eq "2017"
    expect(albums[0].artist_id).to eq "7"
    expect(albums.length).to eq 2
    expect(albums[1].title).to eq 'Mr Morale'
    expect(albums[1].release_year).to eq "2022"
    expect(albums[1].artist_id).to eq "7"

  end
  it "returns correct object attributes when searching with id" do
    repo =  AlbumRepository.new 
    albums = repo.search(1)
    expect(albums[0].title).to eq  'DAMN'
    expect(albums[0].release_year).to eq  "2017"
    expect(albums[0].artist_id).to eq '7'
  end 
  it 'creates a new record in data base from album object' do
    repo = AlbumRepository.new
    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1

    repo.create(album)

    albums = repo.all
    expect(albums.length).to eq 3
    expect(albums[0].title).to eq 'DAMN'
    expect(albums[0].release_year).to eq "2017"
    expect(albums[0].artist_id).to eq "7"
    expect(albums[1].title).to eq 'Mr Morale'
    expect(albums[1].release_year).to eq "2022"
    expect(albums[1].artist_id).to eq "7"
    expect(albums[2].title).to eq 'Trompe le Monde'
    expect(albums[2].release_year).to eq "1991"
    expect(albums[2].artist_id).to eq "1"

  end 

end 