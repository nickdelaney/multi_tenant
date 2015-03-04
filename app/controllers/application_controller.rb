class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  protect_from_forgery with: :null_session
  before_filter :franchise_name
  before_filter :gateway
  helper_method :us_states
  before_filter :roster_count
  before_filter :current_franchise
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
  	   current_franchise = current_user.franchise_id
     end
  end

  def franchise_name
      if user_signed_in?
        @franchise = Franchise.find(current_franchise)
        @franchise_name = @franchise.name
      end
  end

  def new_message_count
    if user_signed_in?
      current_user.mailbox.inbox({:read => false}).count
    end
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

  def us_states
          [
            ['Alabama', 'AL'],
            ['Alaska', 'AK'],
            ['Arizona', 'AZ'],
            ['Arkansas', 'AR'],
            ['California', 'CA'],
            ['Colorado', 'CO'],
            ['Connecticut', 'CT'],
            ['Delaware', 'DE'],
            ['District of Columbia', 'DC'],
            ['Florida', 'FL'],
            ['Georgia', 'GA'],
            ['Hawaii', 'HI'],
            ['Idaho', 'ID'],
            ['Illinois', 'IL'],
            ['Indiana', 'IN'],
            ['Iowa', 'IA'],
            ['Kansas', 'KS'],
            ['Kentucky', 'KY'],
            ['Louisiana', 'LA'],
            ['Maine', 'ME'],
            ['Maryland', 'MD'],
            ['Massachusetts', 'MA'],
            ['Michigan', 'MI'],
            ['Minnesota', 'MN'],
            ['Mississippi', 'MS'],
            ['Missouri', 'MO'],
            ['Montana', 'MT'],
            ['Nebraska', 'NE'],
            ['Nevada', 'NV'],
            ['New Hampshire', 'NH'],
            ['New Jersey', 'NJ'],
            ['New Mexico', 'NM'],
            ['New York', 'NY'],
            ['North Carolina', 'NC'],
            ['North Dakota', 'ND'],
            ['Ohio', 'OH'],
            ['Oklahoma', 'OK'],
            ['Oregon', 'OR'],
            ['Pennsylvania', 'PA'],
            ['Puerto Rico', 'PR'],
            ['Rhode Island', 'RI'],
            ['South Carolina', 'SC'],
            ['South Dakota', 'SD'],
            ['Tennessee', 'TN'],
            ['Texas', 'TX'],
            ['Utah', 'UT'],
            ['Vermont', 'VT'],
            ['Virginia', 'VA'],
            ['Washington', 'WA'],
            ['West Virginia', 'WV'],
            ['Wisconsin', 'WI'],
            ['Wyoming', 'WY']
          ]
  end



  def gateway
              @gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
                 :login     => '84BW232cYmB',
                 :password  => '79A7RcCw7zf6Sk7w',
                 :test => true
              )
                @cim = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
                       :login     => '84BW232cYmB',
                       :password  => '79A7RcCw7zf6Sk7w',
                       :test => true
              )
    end

helper_method :new_message_count

=======
  protect_from_forgery with: :exception

  def authenticate_active_admin_user!
        authenticate_user!
        unless current_user.role?(:administrator)
            flash[:alert] = 'You are not allowed here!'
            redirect_to root_path
        end
    end
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
