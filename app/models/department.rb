class Department < ApplicationRecord
  has_many :users
  has_many :posts, through: :users
  
  validates :name, :presence => true, :uniqueness => true
end
