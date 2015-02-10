class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :franchise_name
  before_filter :roster_count

  def after_sign_in_path_for(resource)
  	if current_user.role == 'admin'
  		admin_path
  	else
  		root_path
  	end
  end

  def current_franchise
    if user_signed_in?
  	   current_user.franchise_id
     end
  end

  def franchise_name
      if user_signed_in?
        @franchise = Franchise.find(current_franchise)
        @franchise_name = @franchise.name
      end
  end

  def check_role
      if current_user.role.name != 'admin'
            redirect_to student_path
      end
  end

 def roster_count
    Roster.count(section_id: params[:id], franchise_id: current_franchise)
  end

end
