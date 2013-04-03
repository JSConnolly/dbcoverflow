class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new( params[:user] )
    if @user.save
      session[:errors].clear if session[:errors]
  	 redirect_to user_path(@user.id)
    else 
      session[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
