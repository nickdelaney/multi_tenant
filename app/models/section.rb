class Section < ActiveRecord::Base
  belongs_to :preschool
  belongs_to :franchise
  has_many :students
  has_many :rosters
end
