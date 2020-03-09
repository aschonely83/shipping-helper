class UsersController < ApplicationController
  def new
    
  end
  
  def create 
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
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