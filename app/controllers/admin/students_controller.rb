class Admin::StudentsController < ApplicationController
	before_action :find_student, only:[:show, :edit, :destroy, :update]
	before_action :all_students, only:[:index]
	before_action :check_role

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

	def destroy
		@student.destroy
		redirect_to admin_users_path
	end

	private
	def find_student
		@student = Student.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def student_params
		params.require(:student).permit(:first_name,:last_name, :user_id).merge(franchise_id: current_franchise)
	end
end
