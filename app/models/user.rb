class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :password_digest
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: true
  
  has_many :finished_products
  has_many :retailers, through: :finished_products
end