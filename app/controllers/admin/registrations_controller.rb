class Admin::RegistrationsController < Devise::RegistrationsController
	helper_method :us_states
      prepend_before_filter :require_no_authentication, :only => []
      prepend_before_filter :authenticate_scope!
      add_breadcrumb "Users", :admin_users_path
      before_filter :configure_permitted_parameters, :only => [:update,:edit]
	

    def new
       add_breadcrumb "New User", :admin_users_path
    	 @user = User.new

  	end

    def update
    end

    def edit
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
	



 
      private

      def registration_params
            params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation, :address_1, :address_2, :city, :zip, :state, :role_id).merge(franchise_id: '1')
      end

      def cim_params
            params.recuire(:email)
      end


end