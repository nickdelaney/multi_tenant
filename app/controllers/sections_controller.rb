class SectionsController < ApplicationController
<<<<<<< HEAD
	before_action :find_section, only:[:show, :edit, :destroy, :update]
	before_action :all_sections, only:[:index]

	def index
	end

	def new
=======
	before_action :find_section, only: [:show, :edit, :destroy, :update, :find_preschool]
	def index
		@sections = Section.all
	end

	def show
	end

	def new
		@preschools = Preschool.all
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
		@section = Section.new
	end

	def create
<<<<<<< HEAD
		@section = Section.new(section_params)
		if @section.save
			redirect_to admin_section_path(@section)
=======
		@preschools = Preschool.all
		@section = Section.new(section_params)
		@section.preschool = Preschool.find(params[:section][:preschool])
		if @section.save
			redirect_to @section
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
		else
			render 'new'
		end
	end

<<<<<<< HEAD
	def show
	end

	def edit
	end

	def update
		if @section.update(section_params)
			redirect_to admin_section_path(@section)
		else
			render 'edit'
=======
	def edit
		@preschools = Preschool.all
	end

	def update
		@preschools = Preschool.all
		@section.preschool = Preschool.find(params[:section][:preschool])
		if @section.update(section_params)
			redirect_to @section
		else
			render 'new'
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
		end
	end

	def destroy
<<<<<<< HEAD
		@section.destroy
		redirect_to admin_sections_path
=======
	end

	def roster
		@roster = Roster.where(sectiond_id: params[:id])
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
	end

	private

	def find_section
<<<<<<< HEAD
		@section = Section.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_sections
		@sections = Section.where(franchise_id: current_franchise)
	end

	def section_params
		params.require(:section).permit(:name,:description,:class_size,:section_time, :preschool_id).merge(franchise_id: current_franchise)
	end
=======
		@section = Section.find(params[:id])
	end

	def find_preschool
		@preschool = Preschool.find(@section.preschool_id)
	end

	def find_students
		@students = Student.where(section_id: params[:id])
	end

	def section_params
		params.require(:section).permit(:name, :description, :class_size, :section_time)
	end

>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
