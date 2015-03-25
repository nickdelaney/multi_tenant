class Cart < ActiveRecord::Base
	belongs_to :franchise
	belongs_to :user
	belongs_to :product
end
