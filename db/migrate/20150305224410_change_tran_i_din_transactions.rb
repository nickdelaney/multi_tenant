class ChangeTranIDinTransactions < ActiveRecord::Migration
  def change
  	  	change_column :transactions, :tran_id, :string
  end
end
