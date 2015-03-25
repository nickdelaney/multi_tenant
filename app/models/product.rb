class Product < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :type
  has_many :carts
end
