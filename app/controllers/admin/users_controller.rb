class Admin::UsersController < ApplicationController
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
		@recurring_payments = AutoBilling.where(franchise_id: current_franchise, user_id: params[:id])
		@payment_profile = @cim.get_customer_profile(
				:customer_profile_id => @user.customer_profile_id
		)
		@payment_profiles = @payment_profile.params["paymentProfiles"]
		@current_franchise = current_franchise
	end

	def user_students
		@students = Student.where(franchise_id: current_franchise, id: params[:id])
	end


	def newProfile
		add_breadcrumb "New Payment Profile", :admin_payments_newProfile_path
		@newProfile = PaymentProfile.new
	end



	def createProfile
		@user = User.find_by(id: params[:user_id], franchise_id: current_franchise)
		@customer_profile_id = @user.customer_profile_id
		@creditcard = ActiveMerchant::Billing::CreditCard.new(credit_params)
		@billinginfo = billing_info
		@response = @cim.create_customer_payment_profile(
			:customer_profile_id => @customer_profile_id,
			:payment_profile => {
				:payment => {:credit_card => @creditcard },
				:bill_to => @billinginfo
			}

		)
		if @response.success?
			@user.payment_profile_id = @response.params["customer_payment_profile_id"]
			if @user.save
				redirect_to admin_users_path
		 	else
		 		render 'newProfile' 
		 	end

		end
	end

	def editProfile
	end




	def updateProfile
		@user = User.find_by(id: params[:user_id], franchise_id: current_franchise)
		@customer_profile_id = @user.customer_profile_id
		@customer_payment_profile_id = @user.payment_profile_id
		@creditcard = ActiveMerchant::Billing::CreditCard.new(credit_params)
		@response = @cim.update_customer_payment_profile(
			:customer_profile_id => @customer_profile_id,
			:payment_profile => {
				:customer_payment_profile_id => @customer_payment_profile_id,
				:payment => {:credit_card => @creditcard }
			},


			

		)

	end

	private


	def credit_params
		 params.require(:creditcard).permit(:name,:number,:month,:year,:verification_value)
	end

	def billing_info
		 params.require(:billinginfo).permit(:first_name,:last_name,:address,:city,:state,:zip,:phone_number)
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


end
