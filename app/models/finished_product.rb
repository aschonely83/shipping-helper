class FinishedProduct< ActiveRecord::Base
  belongs_to :user
  belongs_to :retailer

  def user_name
    self.user = User.find_or_create_by(name: name)
  end

  def user_name=(name)
    self.user ? self.user.name : nil
  end

  def retailer_name
    self.retailer = Retailer.find_or_create_by(name: name)
  end

  def retailer_name=(name)
    self.retailer ? self.retailer.name : nil
  end
end