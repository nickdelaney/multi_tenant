class Franchise < ActiveRecord::Base
	has_many :users
	has_many :preschools
end
