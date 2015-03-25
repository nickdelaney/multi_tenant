class Admin::RostersController < AdminController
	before_action :find_roster, only:[:show, :edit, :destroy, :update]
	before_action :check_role
	before_action :all_rosters, only:[:index]
	add_breadcrumb "Sections", :admin_sections_path
	def index
	end

	def show
		add_breadcrumb "Section Roster", :admin_roster_path
	end

	def edit
	end

	def enroll
	end



	def checkin
		
		@checked_in = Checkin.where('created_at BETWEEN ? AND ? AND student_id = ?', DateTime.now.beginning_of_day,DateTime.now.end_of_day, params[:student_id])
		@student = Student.find(params[:student_id])
		@name = "#{@student.first_name} #{@student.last_name}"
		@checkin = Checkin.new(section_id: params[:section_id], franchise_id: current_franchise, user_id: @student.user.try(:id), student_id: @student.id)
			if @checked_in.count > 0
				flash[:error] = "#{@name} is already checked in!"
		 		redirect_to request.referer
			else
				if credit_balance(@student.user_id) > 0
					@checkin = @checkin.save 
				 		if @checkin
				 			flash[:notice] = "#{@name} Checked in and has #{credit_balance(@student.user_id)} credits remaining!"
				 			redirect_to request.referer
				 		else
				 			flash[:notice] = "There was an error checking #{@name} in"
				 			redirect_to request.referer
				 		end
				 	else
				 		flash[:notice] = "#{@name} has no credits remaining!"
				 		redirect_to request.referer
				 

		 	end
		 end
	end

	def update
	end

	def destroy
	end

	def section_name
		@section = Section.find_by(id: params[:id], franchise_id: current_franchise)
		@section.name
	end

	helper_method :section_name


	private

	def find_roster
		@rosters = Roster.where(section_id: params[:id], franchise_id: current_franchise)
	end


end
