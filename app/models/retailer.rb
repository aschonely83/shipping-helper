class Retailer < ActiveRecord::Base
  has_many :finished_products
  has_many :users, :through => :finished_products
  validate :name_and_schedule

  def name_and_schedule
    if name.blank? && schedule.blank?
      errors.add(:name,:schedule, "You must enter a name and schedule")
    end
  end
end