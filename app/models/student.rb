class Student < ActiveRecord::Base
	belongs_to :user
	belongs_to :preschool
	belongs_to :roster
end
