class Section < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :preschool
  belongs_to :franchise
  has_many :students
  has_many :rosters
=======
	belongs_to :preschool
	validates_presence_of :preschool
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
