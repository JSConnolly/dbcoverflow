class AnswersController < ApplicationController
	respond_to :html, :js
	def index	
	end

	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.new params[:answer].merge( user_id: current_user.id )
	  @answer.save
		@answer
	end

	def show
		
	end
end