class User < ActiveRecord::Base
  validates :email, uniqueness: true
  
  has_many :finished_products
  has_many :retailers, through: :finished_products
end