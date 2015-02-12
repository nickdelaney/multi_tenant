# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  before_action :gateway
 
  def new
    @payment = Payment.new
    @creditcard = ActiveMerchant::Billing::CreditCard.new
  end
 
  def create
    @payment = Payment.new(payment_params)
    @creditcard = ActiveMerchant::Billing::CreditCard.new(credit_params)
    if @creditcard.valid?
        @response = @cim.create_customer_profile(
          :profile => {
            :email => 'alyssa@alyssa.com',
            :payment_profiles => {
              :payment => {:credit_card => @creditcard }
            },
            :ship_to_list => {
              :first_name => 'alyssa',
              :last_name => 'mammano',
              :address => 'hello',
              :city => 'Oswego',
              :state => 'Ny',
              :zip => '13126',
              :county => 'USA',
              :phone_number => '555-555-5555'
            }
          }
        )
        if @response.success?
          flash[:notice] = "Payment success and profile created"
        else
          flash[:notice] = "Payment success and profile failed"
        end
      flash[:notice] = "Credit card invalid"
    end
  end

  private

  def payment_params
	   params.require(:payment).permit(:amount)
  end

  def credit_params
    params.require(:creditcard).permit(:name,:number,:month,:year,:verification_value)
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

