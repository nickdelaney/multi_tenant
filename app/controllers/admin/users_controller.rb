class Admin::UsersController < ApplicationController
	add_breadcrumb "Members", :admin_users_path
	def index
		@users = User.where(franchise_id: current_franchise, role: 2)
	end

	def faculty
		add_breadcrumb "Faculty", :faculty_admin_users_path
		@employees = User.where(franchise_id: current_franchise, role: 1)
	end


	def create
	end

	def show
		add_breadcrumb "Member", :admin_user_path
		@user = User.find_by(id: params[:id], franchise_id: current_franchise)
		@students = Student.where(franchise_id: current_franchise, user_id: params[:id])
	end

	def user_students
		@students = Student.where(franchise_id: current_franchise, id: params[:id])
	end

	private

	def find_student
		@student = student.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_students
		@students = student.where(franchise_id: current_franchise)
	end

	def user_params
		params.require(:student).permit(:email,).merge(franchise_id: current_franchise)
	end

end
