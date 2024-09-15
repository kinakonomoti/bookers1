class BooksController < ApplicationController

 def create
  @book = Book.new(book_paramas)
  if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    flash.now[:alert] = "投稿に失敗しました"
    render :index
  end
 end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_paramas)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_paramas
    params.require(:book).permit(:title, :body)
  end
end
