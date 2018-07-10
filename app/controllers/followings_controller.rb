class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    @user = User.find(params[:user_id])
    @following = Following.create(follower: current_user, followee: @user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    Following.where(["followee_id = ? and follower_id = ?", @user.id, current_user.id]).each { |f| f.delete }
    redirect_to user_path(@user)
  end


end
