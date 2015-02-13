class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :franchise_name
  before_filter :roster_count
  add_breadcrumb "Home", :root_path

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

  def new_message_count
    current_user.mailbox.inbox({:read => false}).count
  end

  def check_role
    if user_signed_in?
      if current_user.role.name != 'admin'
            redirect_to new_user_session_path
      else

      end
    else
      redirect_to new_user_session_path
    end

  end

  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end
 
def redirect_back_or(path)
  redirect_to request.referer || path
end

 def roster_count
    Roster.count(section_id: params[:id], franchise_id: current_franchise)
  end

helper_method :new_message_count

end
