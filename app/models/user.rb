class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
<<<<<<< HEAD
  acts_as_messageable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable 
  has_many :posts
  has_many :students
  has_many :autoBillings
  belongs_to :role
end
=======
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  # we set up our User relation ship
  belongs_to :franchise
  has_many :students
  validates_presence_of :franchise
  # we tell User that we can take company attributes

  def role?(r)
        (role || '').include? r.to_s
  end
 
end
>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
