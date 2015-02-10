class Roster < ActiveRecord::Base
  belongs_to :section
  belongs_to :franchise
  belongs_to :student
end
