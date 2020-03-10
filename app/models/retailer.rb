class Retailer < ActiveRecord::Base
  has_many :finished_products
  has_many :users, through: :finished_products
end