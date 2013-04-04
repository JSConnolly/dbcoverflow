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
      # session[:user] = params[:email]
      login_user(@user)
      session[:errors].clear if session[:errors]
  	 redirect_to user_path(@user.id)
    else 
      session[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    redirect_to login_path and return unless current_user
    unless current_user == User.find(params[:id])
      flash[:errors] = "You're not authorized to view that..."
      redirect_to user_path(current_user.id) and return
    end
    # if current_user
    #   redirect_to user_path(current_user.id)
    # else
    #   flash[:errors] = "You can't do that"
    #   redirect_to index
    # end
  end
end
