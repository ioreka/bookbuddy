class ReadingsController < ApplicationController

  def new
    @reading = Reading.new

  end

  def create
    @book = Book.find(params[:book_id])
    @reading = Reading.create(user: current_user, book: @book)
    redirect_to user_path(current_user)
  end


end
