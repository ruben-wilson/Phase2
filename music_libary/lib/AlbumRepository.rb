require_relative "album"


class AlbumRepository

  # Selecting all records
  # No arguments
  def all
   sql = "SElECT * FROM albums;"
   albums = []
   result_set = DatabaseConnection.exec_params(sql, [])
   result_set.each{ |records|
    album = Album.new
    album.title = records["title"]
    album.artist_id = records["artist_id"]
    album.release_year = records["release_year"]
    albums << album
  }
   return  albums 
  end

  def search(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    params = [id]
    albums = []
    result_set = DatabaseConnection.exec_params(sql, params)
    result_set.each{|record|
      album = Album.new
      album.title = record["title"]
      album.artist_id = record["artist_id"]
      album.release_year = record["release_year"]
      albums << album
    }
    return albums
  end 

  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1, $2, $3);'
    params = []
    params << album.title
    params << album.release_year
    params << album.artist_id
    DatabaseConnection.exec_params(sql, params)
  end

end