class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to list_path(books.id)
  end

  def index
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
