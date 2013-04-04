module SessionsHelper
	
	def login_user(user)
		session[:user_id] = user.id
	end
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def sign_out
		session.clear
	end

	def authenticate!
		redirect_to login_path, :notice => 'please login or sinup' unless current_user.present?
	end

end
