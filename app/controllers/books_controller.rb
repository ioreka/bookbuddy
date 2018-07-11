class BooksController < ApplicationController

  before_action :authorized?

  include GoogleBooksHelper

  @@book_search_results = []

  def index
    authorized?
    @books = Book.all
  end

  def search_results
    @books = @@book_search_results
  end

  def search
    if params[:search] && params[:search] != ""
      @@book_search_results = search_for_books(params[:search])
      redirect_to search_results_path
    else
      flash[:search_error] = "There are no results matching this search"
      redirect_to books_path
    end
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
    params.require(:book).permit(:title, :description, :author, :subtitle, :publisher, :publishedDate, :pageCount, :imageLinks, :previewLink)
  end

end
