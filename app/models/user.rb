class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 



  has_many :posts
  has_many :students, :inverse_of => :user
  belongs_to :role

  accepts_nested_attributes_for :students
end
