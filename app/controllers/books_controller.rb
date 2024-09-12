class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_paramas)
    book.save
    redirect_to '/books/new'
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private
  def book_paramas
    params.require(:book).permit(:title, :body)
  end
end
