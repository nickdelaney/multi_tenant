class Members::MembersController < ApplicationController
	def index
		@member = User.find_by(franchise_id: current_franchise, id: current_user.id)
	end
end
