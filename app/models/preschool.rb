class Preschool < ActiveRecord::Base
	belongs_to :franchise
	has_many :students
	has_many :sections
	validates_presence_of :franchise
end
