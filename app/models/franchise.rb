class Franchise < ActiveRecord::Base
	has_many :posts
	has_many :users
	has_many :buses
	has_many :rosters
	has_many :students
	has_many :sections
	has_many :auto_billings
	has_many :transactions
	has_many :checkins
end
