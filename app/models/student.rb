class Student < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :birthdate, presence: true
	validates :preschool, presence: true

  belongs_to :user
  belongs_to :franchise
  belongs_to :preschool
  has_many :rosters
  has_many :evaluations
  has_many :checkins

end
