# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/AlbumRepository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_libary')

albums = AlbumRepository.new

albums.search(3).each{|album|
  p album}