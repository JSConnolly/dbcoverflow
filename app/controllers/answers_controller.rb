class AnswersController < ApplicationController
	respond_to :html, :js
	def index
			
	end

	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.create params[:answer].merge( user_id: current_user.id )
		respond_with @answer
	end

	def show
		
	end
end