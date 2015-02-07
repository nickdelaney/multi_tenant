class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
  belongs_to :preschool
end
