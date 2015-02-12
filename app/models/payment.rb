class Payment < ActiveRecord::Base
 
  PROCESSING, FAILED, SUCCESS = 1, 2, 3
 
  validates :valid_card, :inclusion => {:in => [true], :message => 'Invalid Credit Card'}
  validates :amount, :presence => true, :numericality => { :greater_than => 0 }
 
  def process_payment(creditcard)
    ActiveMerchant::Billing::Base.mode = auth['mode'].to_sym
    self.status = PROCESSING
    response = gateway.purchase(amount * 100, creditcard)
 
    if response.success?
      self.transaction_number = response.subscription_id
      self.status = SUCCESS
    else
      self.status = FAILED
    end
    return self
  rescue Exception => e
    self.status = FAILED
    return self
  end
 
  def success?
    self.status == SUCCESS
  end
 
  private
  def gateway
    ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login    => auth['login'],
      :password => auth['key'])
  end
 
  def auth
    @@auth ||= YAML.load_file("#{Rails.root}/config/authorize_net.yml")[Rails.env]
  end
end