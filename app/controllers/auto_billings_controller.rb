class AutoBillingsController < ApplicationController

	def new
		@auto_billing = AutoBilling.new
	end

	def create
		@credits = params[:auto_billing][:credits].to_i 
		@amount = @credits * 10
		@auto_billing = AutoBilling.new(auto_billing_params)
			if @auto_billing.save
				redirect_to users_path
				flash[:notice] = 'Autobilling saved!'
			else
				render 'new'
			end
		
	end

	private

	def auto_billing_params
		params.require(:auto_billing).permit(:credits).merge(user_id: current_user.id, active: '1')
	end

end