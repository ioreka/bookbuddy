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

  def destroy
    @user = current_user
    @reading = Reading.find(params[:reading_id])
    @reading.delete
    redirect_to @user
  end

  def show
    @reading = Reading.find(params[:id])
  end


end
