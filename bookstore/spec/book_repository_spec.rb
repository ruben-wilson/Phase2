require "book_repository"

def reset_students_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
  connection.exec(seed_sql)
end

RSpec.describe BookRepository do
  before(:each) do 
    reset_students_table
  end
  it "returns all books in books table from book_shop data base" do 
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 2
    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq 'book1'
    expect(books[0].author_name).to eq 'i wrote book1'
    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq 'book2'
    expect(books[1].author_name).to eq 'i wrote book2'
  end 


end