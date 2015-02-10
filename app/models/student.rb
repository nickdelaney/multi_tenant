class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
  belongs_to :preschool
  has_many :rosters

end
