ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
   :login     => '84BW232cYmB',
   :password  => '79A7RcCw7zf6Sk7w',
   :test => true
  )
