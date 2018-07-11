class ReadingsController < ApplicationController

  before_action :authorized?

  def new
    @reading = Reading.new

  end

  def create
    @book = Book.find(params[:book_id])
    @reading = Reading.create(user: current_user, book: @book)
    flash[:book_added] = "#{@book.title} was succesfully added to your booklist!"
    redirect_to search_results_path
  end


end
