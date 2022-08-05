require_relative "book"

class BookRepository
  def all
    books = []
    sql = ''
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each{|book|
      object = Book.new
      object.id = book['id']
      object.author_name = book['author_name']
      object.title = book['title']
      books << object
    }
    return books
    # Returns an array of Student objects.
  end
end