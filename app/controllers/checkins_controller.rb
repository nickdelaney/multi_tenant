class CheckinsController < ApplicationController
	def index
		@checkins = Checkin.where(user_id: current_user.id)
	end
end
