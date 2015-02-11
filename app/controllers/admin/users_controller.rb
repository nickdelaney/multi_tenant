class Admin::UsersController < ApplicationController
	def index
		@users = User.where(franchise_id: current_franchise, role: 2)
	end

	def faculty
		@employees = User.where(franchise_id: current_franchise, role: 1)
	end


	def create
	end

	def show
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
