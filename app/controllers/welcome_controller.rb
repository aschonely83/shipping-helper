class WelcomeController < ApplicationController
  skip_before_action :verified_user, only: [:home]
  def home
  end

  def signup
    @user = User.new
  end
end