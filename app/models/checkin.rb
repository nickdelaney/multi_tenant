class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
  belongs_to :section
  belongs_to :student
  belongs_to :roster
end
