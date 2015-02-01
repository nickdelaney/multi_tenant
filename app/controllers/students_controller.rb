class StudentsController < ApplicationController
	before_action :find_student, only: [:show, :edit, :destroy, :update, :age]
	before_action :age, only: [:show]
	before_action :find_preschool, only: [:show]

	def index
		@students = Student.all
	end

	def show
	end

	def new
		@preschools = Preschool.all
		@student = current_user.students.build
	end

	def create
		@preschools = Preschool.all
		@student = current_user.students.build(student_params)
		@student.preschool = Preschool.find(params[:student][:preschool])
		if @student.save
			redirect_to @student
		else
			render 'new'
		end
		
	end

	def edit
		@preschools = Preschool.all
	end

	def update
		@preschools = Preschool.all
		@student.preschool = Preschool.find(params[:student][:preschool])
		if @student.update(student_params)
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def find_student
		@student = Student.find(params[:id])
	end

	def age
		@age = ((Date.today - @student.birthdate).to_i / 365.25).ceil
	end

	def find_preschool
		@preschool = Preschool.find(@student.preschool_id)
	end

	def student_params
		params.require(:student).permit(:first_name, :last_name, :birthdate)
	end
	
end
