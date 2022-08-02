# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/AlbumRepository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_libary')

albums = AlbumRepository.new

albums.all.each{|album|
  p album
}