class SectionsController < ApplicationController
	before_action :find_section, only: [:show, :edit, :destroy, :update, :find_preschool]
	def index
		@sections = Section.all
	end

	def show
	end

	def new
		@preschools = Preschool.all
		@section = Section.new
	end

	def create
		@preschools = Preschool.all
		@section = Section.new(section_params)
		@section.preschool = Preschool.find(params[:section][:preschool])
		if @section.save
			redirect_to @section
		else
			render 'new'
		end
	end

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
		end
	end

	def destroy
	end

	private

	def find_section
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

end
