class Admin::RostersController < ApplicationController
	before_action :find_roster, only:[:show, :edit, :destroy, :update]
	before_action :check_role
	before_action :all_rosters, only:[:index]

	def index
	end

	def show
	end

	def edit
	end

	def enroll
	end

	def update
	end

	def destroy
	end




	private

	def find_roster
		@rosters = Roster.where(section_id: params[:id], franchise_id: current_franchise)
	end


end
