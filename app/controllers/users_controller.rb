class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create 
    @user = User.create(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end
end  