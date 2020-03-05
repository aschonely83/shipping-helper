class UsersController < ApplicationController
    
  def show
    @user = current_user
  end

  def create
    @user = User.create(params.require(:email).permit(:password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
 end
end