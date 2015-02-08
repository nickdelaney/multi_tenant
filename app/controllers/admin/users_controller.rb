class Admin::UsersController < ApplicationController
	def index
		@employees = User.where(franchise_id: current_franchise, role: 2)
	end

	def faculty
		@employees = User.where(franchise_id: current_franchise, role: 1)
	end


end
