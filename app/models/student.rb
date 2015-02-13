class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
  belongs_to :preschool
  has_many :rosters
  has_many :evaluations

end
