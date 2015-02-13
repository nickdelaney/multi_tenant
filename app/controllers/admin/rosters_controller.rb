class Admin::RostersController < ApplicationController
	before_action :find_roster, only:[:show, :edit, :destroy, :update]
	before_action :check_role
	before_action :all_rosters, only:[:index]
	add_breadcrumb "Sections", :admin_sections_path
	def index
	end

	def show
		add_breadcrumb "Section Roster", :admin_roster_path
	end

	def edit
	end

	def enroll
	end

	def update
	end

	def destroy
	end

	def section_name
		@section = Section.find_by(id: params[:id], franchise_id: current_franchise)
		@section.name
	end

	helper_method :section_name


	private

	def find_roster
		@rosters = Roster.where(section_id: params[:id], franchise_id: current_franchise)
	end


end
