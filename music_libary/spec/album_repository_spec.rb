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

  it "" do 
    
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

end 