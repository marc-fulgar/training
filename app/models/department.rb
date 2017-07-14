class Department < ApplicationRecord
  has_many :users
  has_many :posts, through: :users
  
  validates :name, presence: {message: "Name cannot be blank"}
  validates :name, :uniqueness => true
end
