class Preschool < ActiveRecord::Base
	belongs_to :franchise
	has_many :students
	validates_presence_of :franchise
end
