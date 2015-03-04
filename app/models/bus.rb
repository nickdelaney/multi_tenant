class Bus < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :franchise
=======
	belongs_to :franchise
	validates_presence_of :franchise
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
