class Preschool < ActiveRecord::Base
	belongs_to :franchise
	validates_presence_of :franchise
end
