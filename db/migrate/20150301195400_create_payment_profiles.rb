class CreatePaymentProfiles < ActiveRecord::Migration
  def change
    create_table :payment_profiles do |t|

      t.timestamps null: false
    end
  end
end
