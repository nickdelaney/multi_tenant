class EvaluationsController < ApplicationController
	def index 
	end

	def show
		@evaluation = Evaluation.find_by(id: params[:id], user_id: current_user.id)
	end
end
