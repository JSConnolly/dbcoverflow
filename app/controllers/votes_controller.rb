class VotesController < ApplicationController
	def create
		@vote = Vote.create
	end
end