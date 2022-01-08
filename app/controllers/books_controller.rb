class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
      flash[:notice] = "Book was successfully created."
    end
  end

  def index
   @books = Book.all
   @book = Book.new
   flash[:notice] = "Book was successfully destroyed."
  end

  def show
    @book = Book.find(params[:id])
    flash[:notice] = "Book was successfully created."

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     flash[:notice] = "Book was successfully created."
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end