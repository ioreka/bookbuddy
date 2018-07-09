class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      redirect_to @book
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.valid?
      redirect_to @book
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author)
  end

end
