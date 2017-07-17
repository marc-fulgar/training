class Department < ApplicationRecord
  has_many :users
  has_many :posts, through: :users
  
  validates :name, presence: {message: " cannot be blank"}, length: {maximum: 20, message: " is too long (maximum is 20 characters)"}
  validates :name, uniqueness: true
  
  def strip_whitespace
    self.username = self.username.strip unless self.username.nil?
    self.email = self.email.strip unless self.email.nil?
  end
end