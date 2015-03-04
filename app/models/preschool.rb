class Preschool < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :franchise
  has_many :sections
  has_many :sections, through: :preschools
  has_many :students
=======
	belongs_to :franchise
	has_many :students
	has_many :sections
	validates_presence_of :franchise
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
