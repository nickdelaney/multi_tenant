class Admin::PaymentsController < ApplicationController
	before_action :gateway

	def new
	end

	

	def show
	end

	


	private

		 def credit_params
		 	params.require(:creditcard).permit(:first_name,:last_name,:number,:month,:year,:verification_value)
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
