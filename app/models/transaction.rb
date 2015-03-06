class Transaction < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :user
end
