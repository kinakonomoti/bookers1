class HomesController < ApplicationController
   def top
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :top
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
