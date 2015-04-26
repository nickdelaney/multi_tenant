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
		@user = User.find(current_user.id)
		@customer_profile_id = @user.customer_profile_id
		if @user.payment_profile_id
			@response = @cim.delete_customer_payment_profile(
				:customer_profile_id => @customer_profile_id,
				:customer_payment_profile_id => @user.payment_profile_id
				)
		end

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
				redirect_to root_path
		 	else
		 		redirect_to newProfile_path
		 		@errors
		 	end
		else
			@error = @response.params["messages"]["message"]["code"]
			
			case @error
			when 'E00001'
				@error = 'Error code E00001 please report to webmaster@beebus.com'
			when 'E00002'
				@error = 'Error code E00002 please report to webmaster@beebus.com'
			when 'E00003'
				@error = 'Error code E00003 please report to webmaster@beebus.com'
			when 'E00004'
				@error = 'Error code E00004 please report to webmaster@beebus.com'
			when 'E00005'
				@error = 'Error code E00005 please report to webmaster@beebus.com'
			when 'E00006'
				@error = 'Error code E00006 please report to webmaster@beebus.com'
			when 'E00007'
				@error = 'Error code E00007 please report to webmaster@beebus.com'
			when 'E00008'
				@error = 'Error code E00008 please report to webmaster@beebus.com'	
			when 'E00009'
				@error = 'Error code E00009 please report to webmaster@beebus.com'
			when 'E00010'
				@error = 'Error code E000010 please report to webmaster@beebus.com'
			when 'E00011'
				@error = 'Error code E00011 please report to webmaster@beebus.com'
			when 'E00013'
				@error = 'One of the field values is not valid'
			when 'E00014'	
				@error = 'One of the required fields was not present.'
			when 'E00015'
				@error = 'One of the fields has an invalid length.'
			when 'E00016'
				@error = 'The field type is not valid.'
			when 'E00017'
				@error = 'The field type is not valid.'	
			else
				@error = @error
			end

			flash[:error] = @error
			redirect_to newProfile_path
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
