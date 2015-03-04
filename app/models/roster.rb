class Roster < ActiveRecord::Base
<<<<<<< HEAD
  has_many :users
  belongs_to :section
  belongs_to :franchise
  belongs_to :student
=======
	has_many :students
	has_many :sections
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
