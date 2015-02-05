class AddFranchiseToUser < ActiveRecord::Migration
  def change
    add_reference :users, :franchise, index: true
    add_foreign_key :users, :franchises
  end
end
