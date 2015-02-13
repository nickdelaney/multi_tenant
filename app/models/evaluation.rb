class Evaluation < ActiveRecord::Base
  belongs_to :student
  belongs_to :franchise
  belongs_to :user

  has_attached_file :picture, styles: {  medium: "400x600#", small: "200x400>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
