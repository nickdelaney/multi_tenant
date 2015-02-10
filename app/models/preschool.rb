class Preschool < ActiveRecord::Base
  belongs_to :franchise
  has_many :sections
  has_many :sections, through: :preschools
  has_many :students
end
