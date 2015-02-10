class Roster < ActiveRecord::Base
  has_many :users
  belongs_to :section
  belongs_to :franchise
  belongs_to :student
end
