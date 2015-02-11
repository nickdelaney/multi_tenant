class Admin::StudentsController < ApplicationController
	before_action :find_student, only:[:show, :edit, :destroy, :update, :enroll]
	before_action :all_students, only:[:index]
	before_action :check_role
	
	def index
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		@user = params[:user_id]
		if @student.save
			redirect_to admin_user_path(@student.user_id)
		else
			render 'new'
		end
	end

	def show
		@rosters = @student.rosters
	end

	def destroy
		@student.destroy
		redirect_to admin_users_path
	end

	def section
		@student = Student.find(params[:student_id])
		@sections = Section.where(preschool: @student.preschool)
	end

	def enroll
		 @student = Student.find(params[:student_id])
		 if @student.rosters.create(section_id: params[:section_id], franchise_id: current_franchise)
		 	redirect_to admin_student_path(@student)
		 else
		 	render 'section'
		 end
	end


	private
	def all_students
		@students = Student.where(franchise_id: current_franchise)

	end

	def find_student
		@student = Student.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def student_params
		params.require(:student).permit(:first_name,:last_name, :user_id, :preschool_id).merge(franchise_id: current_franchise)
	end
end
