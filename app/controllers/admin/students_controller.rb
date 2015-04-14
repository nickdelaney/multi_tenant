class Admin::StudentsController < AdminController
	before_action :find_student, only:[:show, :edit, :destroy, :update, :enroll]
	before_action :all_students, only:[:index]
	before_action :check_role
	add_breadcrumb "Students", :admin_students_path
	def index
	end

	def new
		add_breadcrumb "New Student", :new_admin_student_path
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		@user = params[:user_id]
		if @student.save
			redirect_to admin_student_path(@student)
			flash[:success] = "Successfully created #{@student.first_name}"
		else
			render 'new'
			flash[:error] = 'There was a problem adding the new student, please try again.'
		end
	end

	def show
		add_breadcrumb "Student", :admin_student_path
		@rosters = @student.rosters
	end

	def destroy
		@student = Student.find(params[:id])
		@user_id = @student.user_id
		if @student.destroy
			redirect_to admin_user_path(@user_id)
			flash[:success] = "Succesfully removed student"
		else
			redirect_to admin_user_path(@user)
			flash[:error] = "There was a problem removing the student, please try again."
		end
	end

	def section
		add_breadcrumb "Choose Section", :admin_student_section_student_path
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

	def checkin
		@student = Student.find(params[:student_id])
			if @student.checkins.create(section_id: params[:section_id], franchise_id: current_franchise, user_id: user.id)
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
		@evaluations = Evaluation.where(student_id: params[:id], franchise_id: current_franchise)
	end

	def student_params
		params.require(:student).permit(:first_name,:last_name, :user_id, :preschool_id, :birthdate).merge(franchise_id: current_franchise)
	end
end
