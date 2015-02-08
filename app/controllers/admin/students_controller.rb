class Admin::StudentsController < ApplicationController
	before_action :find_student, only:[:show, :edit, :destroy, :update]
	before_action :all_students, only:[:index]
	before_action :check_role

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to admin_student_path(@student)
		else
			render 'new'
		end
	end

	private

	def student_params
		params.require(:student).permit(:first_name,:last_name, :user_id).merge(franchise_id: current_franchise)
	end
end
