class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :department
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
  
  attr_accessor :login
  validates :username, :email, :presence => true, :uniqueness => true
  validates :department_id, :first_name, :last_name, :presence => true
  validates :password, on: :create, :presence => true
  validates :password, on: :update, allow_blank: true, :presence => true
  validates_confirmation_of :password
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>", icon:"100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name]
    )
  end
  
  def email_required?
    false
  end
  
  def password_required?
    false
  end
  
  def strip_whitespace
    self.username = self.username.strip unless self.username.nil?
    self.email = self.email.strip unless self.email.nil?
  end
  
  def self.find_for_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
