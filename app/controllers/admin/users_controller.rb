class Admin::UsersController < ApplicationController
	before_action :gateway
	add_breadcrumb "Members", :admin_users_path
	def index
		@users = User.where(franchise_id: current_franchise, role: 2)
	end

	def faculty
		add_breadcrumb "Faculty", :faculty_admin_users_path
		@employees = User.where(franchise_id: current_franchise, role: 1)
	end

	def create
	end

	def show
		add_breadcrumb "Member", :admin_user_path
		@user = User.find_by(id: params[:id], franchise_id: current_franchise)
		@students = Student.where(franchise_id: current_franchise, user_id: params[:id])
	end

	def user_students
		@students = Student.where(franchise_id: current_franchise, id: params[:id])
	end


	def newProfile
		add_breadcrumb "New Payment Profile", :admin_payments_path
		@newProfile = PaymentProfile.new
	end

	def createProfile
		@user = User.find_by(id: params[:user_id], franchise_id: current_franchise)
		@customer_profile_id = @user.customer_profile_id
		@creditcard = ActiveMerchant::Billing::CreditCard.new(credit_params)
		@response = @cim.create_customer_payment_profile(
			:customer_profile_id => @customer_profile_id,
			:payment_profile => {
				:payment => {:credit_card => @creditcard }
			}

		)
		if @response.success?
			@user.payment_profile_id = @response.params["customer_payment_profile_id"]
			@user.save
		end
	end

	private


	def credit_params
		 	params.require(:creditcard).permit(:name,:number,:month,:year,:verification_value)
	end

	def find_student
		@student = student.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_students
		@students = student.where(franchise_id: current_franchise)
	end

	def user_params
		params.require(:student).permit(:email,).merge(franchise_id: current_franchise)
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
