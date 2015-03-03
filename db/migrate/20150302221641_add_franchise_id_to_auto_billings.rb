class AddFranchiseIdToAutoBillings < ActiveRecord::Migration
  def change
    add_reference :auto_billings, :franchise, index: true
    add_foreign_key :auto_billings, :franchises
  end
end
