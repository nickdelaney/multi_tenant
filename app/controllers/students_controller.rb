class StudentsController < ApplicationController

	def index
		@students = Student.where(user_id: current_user.id)
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path
		else
			render 'new'
		end
	end

	def edit
		@student = Student.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def update
		@student = Student.find_by(id: params[:id], franchise_id: current_franchise)
		if @student.update(student_params)
			redirect_to students_path
		else
			render 'edit'
		end
	end




	def show
		@student = Student.find_by(id: params[:id], user_id: current_user.id)
		@checkins = Checkin.where(student_id: params[:id])
		@evaluations = Evaluation.where(student_id: params[:id])
	end

private
	def student_params
		params.require(:student).permit(:first_name,:last_name, :preschool_id, :birthdate).merge(franchise_id: current_franchise, user_id: current_user.id)
	end

end
