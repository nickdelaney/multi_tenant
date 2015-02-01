class Section < ActiveRecord::Base
	belongs_to :preschool
	validates_presence_of :preschool
end
