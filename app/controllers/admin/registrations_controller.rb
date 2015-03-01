class Admin::RegistrationsController < Devise::RegistrationsController
      before_action :check_role
	helper_method :us_states
      before_action :gateway
      prepend_before_filter :require_no_authentication, :only => []
      prepend_before_filter :authenticate_scope!
      add_breadcrumb "Users", :admin_users_path
	def new
       add_breadcrumb "New User", :admin_users_path
    	 @user = User.new

  	end

      def create
            @response = @cim.create_customer_profile(
                  :profile => {
                        :email => params[:user][:email],
                  })
            if @response.success?
                  customer_profile_id = @response.params["customer_profile_id"]
                  flash[:notice] = "Profile Created"
                  @user = User.new(registration_params)
                        if @user.save
                              @user.customer_profile_id = customer_profile_id
                              @user.save
                              redirect_to admin_users_path
                        else
                             flash[:notice] = "Profile Creation Failed"
                             render 'new' 
                        end
            else
                  flash[:notice] = "Profile Creation Failed"
                  
            end

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

      private

      def registration_params
            params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation, :address_1, :address_2, :city, :zip, :state, :role_id).merge(franchise_id: '1')
      end

      def cim_params
            params.recuire(:email)
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

end