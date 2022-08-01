require "album"

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
end