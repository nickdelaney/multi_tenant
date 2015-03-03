class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable 
  has_many :posts
  has_many :students
  has_many :autoBillings
  belongs_to :role
end
