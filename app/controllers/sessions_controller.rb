class SessionsController < ApplicationController
	def new
		render :login_form
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:login_errors].clear if session[:login_errors]
			session[:user] = params[:email]
			login_user(user)
			redirect_to user_path(user.id)
		else
			# session[:login_errors] << "Please try again"
			flash[:notice] = "Nope"
			render :login_form
		end
	end

	def destroy
		sign_out
		redirect_to users_path
	end

end
