class AddPaymentProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payment_profile_id, :integer
  end
end
