class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_finished_product

  def show
  end

  private

  def set_finished_product
    @finished_product = Finished_Product.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password)
  end
end  