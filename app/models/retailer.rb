class Retailer < ActiveRecord::Base
  has_many :finished_prodcuts
  has_many :users, through: :finished_products
end