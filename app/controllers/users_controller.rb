class UsersController < ApplicationController
  before_action :set_readings, only: :show
  before_action :authorized?, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all.sort_by { |x| x.name }
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    authorized_for(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params(:name, :username, :password))
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def update
    authorized_for(params[:id])
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], username: params[:user][:username], bio:params[:user][:bio], password:params[:user][:password] )
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def wall
    @user = current_user
    @selected_readings = Reading.select{ |reading| reading.user.followers.include?(current_user)}
    #authorized_for(current_user)
    #user.followees[0].readings[0].book.title
  end

  private
  def user_params(*args)
    params.require(:user).permit(args)
  end

  def set_readings
    @user = User.find(params[:id])
    @readings = @user.readings
  end


end
