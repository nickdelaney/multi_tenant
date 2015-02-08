class Preschool < ActiveRecord::Base
  belongs_to :franchise
  has_many :sections

end
