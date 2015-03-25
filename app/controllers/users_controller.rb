class UsersController < ApplicationController
	def index
		@user = User.find(current_user)
	end



	
	def update
	end

	def show
		@user = User.find(current_user)
	end


	def newProfile
		@newProfile = PaymentProfile.new
	end

	def createProfile
		@user = User.find_by(id: current_user.id, franchise_id: current_franchise)
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


	private
	def credit_params
		 params.require(:creditcard).permit(:name,:number,:month,:year,:verification_value)
	end

	def billing_info
		 params.require(:billinginfo).permit(:first_name,:last_name,:address,:city,:state,:zip,:phone_number)
	end

end
