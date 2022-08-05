require_relative "artist"


class ArtistRepository

  # Selecting all records
  # No arguments
  def all
   sql = "SElECT * FROM artist;"
   artists = []
   result_set = DatabaseConnection.exec_params(sql, [])
   result_set.each{ |records|
    artist = Album.new
    artist.id = records["id"]
    artist.name = records["name"]
    artist.genre = records["genre"]
    artists << artist
  }
   return artists
  end

end