class QuestionsController < ApplicationController
	# before_filter :authenticate!, :only => [:create]
	respond_to :js, :html
	def index
		@questions = Question.all
		@question = Question.new
	end

	def new
		@question = Question.new
	end

	def create
		@q = Question.new( params[:question] )
		@q.save
		respond_with @q

			# respond_to do |format|
			# 	if @q.save
			# 		format.html { redirect_to @q }
			# 		# redirect_to question_path(q.id)
			# 		format.js
			# 	else
			# 		format.html {render :action => "new" }
			# 		format.js {render }
			# 	end
	end

	def show
		@question = Question.find(params[:id])
	end

end