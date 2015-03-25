class Admin::EvaluationsController < AdminController
	before_action :find_student, only:[:edit, :destroy, :update, :enroll, :new, :create]
	before_action :find_evaluation, only: [:edit,:show,:destroy]
	add_breadcrumb "Students", :admin_students_path
	add_breadcrumb "Evaluations", :admin_evaluations_path

	def index
	end

	def new
		add_breadcrumb "New Evaluation", :new_admin_evaluation_path
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.new(evaluation_params)
		@user = params[:user_id]
		if @evaluation.save
			redirect_to admin_evaluation_path(@evaluation)
		else
			render 'new'
		end
	end

	def show
	end

	def destroy
	end

	private

	def find_student
		@student = Student.find_by(id: params[:student_id], franchise_id: current_franchise)
	end

	def find_evaluation
		@evaluation = Evaluation.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_student_evaluations
		@evaluations = Evaluation.where(franchise_id: current_franchise, student_id: params[:student_id] )
	end

	def evaluation_params
		params.require(:evaluation).permit(:field, :field2, :field3,:student_id, :user_id, :picture).merge(franchise_id: current_franchise)
	end

end
