class CommentsController < ApplicationController

  before_action :authorized?

  def create
    Comment.create(reading_id: params[:reading_id], user_id: session[:user_id], content: params[:content])
    reading = Reading.find(params[:reading_id])
    user = reading.user
    redirect_to user_path(user)
  end

end
