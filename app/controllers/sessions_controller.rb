class SessionsController < ApplicationController
	def new
		render :login_form
	end

	def create
		if User.authenticate(params[:session][:email], params[:session][:password])
			session[:login_errors].clear if session[:login_errors]
			session[:user] = params[:email]
			redirect_to user_path
		else
			session[:login_errors] << "Please try again"
			render :login_form
		end
	end

	def destroy
		
	end

end
