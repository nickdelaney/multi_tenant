class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
  belongs_to :section
end
