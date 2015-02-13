class Admin::SectionsController < ApplicationController
	before_action :find_section, only:[:show, :edit, :destroy, :update]
	before_action :all_sections, only:[:index]
	before_action :check_role
	add_breadcrumb "Sections", :admin_sections_path
	def index
	end

	def new
		add_breadcrumb "New Section", :new_admin_section_path
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			redirect_to admin_section_path(@section)
		else
			render 'new'
		end
	end

	def show
		add_breadcrumb "Section", :admin_section_path
	end

	def edit
		add_breadcrumb "Edit Section", :edit_admin_section_path
	end

	def update
		if @section.update(section_params)
			redirect_to admin_section_path(@section)
		else
			render 'edit'
		end
	end

	def destroy
		@section.destroy
		redirect_to admin_sections_path
	end



	private

	def find_section
		@section = Section.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_sections
		@sections = Section.where(franchise_id: current_franchise)
	end

	def section_params
		params.require(:section).permit(:name,:description,:class_size,:section_time,:preschool_id).merge(franchise_id: current_franchise)
	end
end
