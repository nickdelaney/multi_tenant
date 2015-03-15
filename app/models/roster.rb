class Roster < ActiveRecord::Base
  has_many :users
  has_many :checkins
  belongs_to :section
  belongs_to :franchise
  belongs_to :student
end
