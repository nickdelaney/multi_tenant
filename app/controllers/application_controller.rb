class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :franchise_name
  before_filter :gateway
  helper_method :us_states
  helper_method :credit_balance
  before_filter :roster_count
  before_filter :current_franchise
  before_filter :configure_permitted_parameters, if: :devise_controller?
  add_breadcrumb "Home", :root_path



  def credit_balance(id)
    @credits = Credit.where(:user_id => id)
    @credits = @credits.sum(:count)
    @checkins = Checkin.where(:user_id => id).count
    @balance = @credits.to_i - @checkins.to_i
    @balance
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

protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name, :email, :password, :current_password, :address_1, :address_2, :city, :zip, :state) }
        end

end
