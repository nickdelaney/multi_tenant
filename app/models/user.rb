class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  # we set up our User relation ship
  belongs_to :franchise
  has_many :students
  validates_presence_of :franchise
  # we tell User that we can take company attributes
 
end