class Admin::AutoBillingsController < AdminController
	before_action :find_auto_billing, only:[:show, :edit, :destroy, :update]

	def new
		add_breadcrumb "New Recurring Payment", :new_admin_user_auto_billing_path
		@auto_billing = AutoBilling.new
	end

	def create
		@credits = params[:auto_billing][:credits].to_i 
		@amount = @credits * 10
		@auto_billing = AutoBilling.new(:user_id => params[:user_id], :amount => @amount, :credits => @credits, :active => '1',franchise_id: current_franchise)
			if @auto_billing.save
				redirect_to admin_users_path
			else
				render newRecurringPayment
			end
		
	end

	def destroy
		@autobilling.destroy
		redirect_to admin_user_path(params[:user_id])
	end

	def bill_users

		@invoices = AutoBilling.where(franchise_id: current_franchise,active: '1')
		@invoices.each do |invoice|
			@response =	@cim.create_customer_profile_transaction(
					:transaction => {
						:type => :auth_only,
						:amount => invoice.amount.to_i,
						:customer_profile_id => invoice.user.try(:customer_profile_id),
						:customer_payment_profile_id => invoice.user.try(:payment_profile_id)
						})
			if @response.success?
					@credits = Credit.new(:franchise_id => invoice.user.try(:franchise_id), :count => invoice.credits, :user_id => invoice.user.try(:id))
					@transaction = Transaction.new(:amount => invoice.amount, :user_id => invoice.user.try(:id), :franchise_id => invoice.user.try(:franchise_id), :tran_id => @response.params['direct_response']['transaction_id'], :description => "Reloaded #{invoice.credits}  credits to profile")
					@transaction.save
					@credits.save
			end
		end
	
		
	end


	private
		def find_auto_billing
			@autobilling = AutoBilling.find_by(id: params[:id])
		end

end
