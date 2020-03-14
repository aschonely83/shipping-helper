class FinishedProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_retailer
  before_action :get_user
  before_action :set_finished_product, only: [:show, :edit, :update, :destroy]

  def index
      if params.include?(:retailer_id)
        @finished_products = @retailer.finished_products
         
      else
          @finished_products = @user.finshed_products
      end
  end

  def show
    @finished_product = FinishedProduct.find_by(params[:id])
  end
      
  def new
    @finished_product = @user.finished_products.build
  end

  def create
      @finished_product = @user.finished_products.build(finished_product_params)
      @finished_product.retailer_id = @retailer.id
      if @finished_product.save
          redirect_to retailer_finished_products_path(@retailer)
      else
          render :new
      end
  end

  def edit
    @finished_product = FinishedProduct.find(params[:id]) 
  end

  def update
    if @finished_product.update(finished_product_params)
      redirect_to retailer_finished_products_path
    else
      render :edit
    end
  end

  def destroy
      @finished_product.destroy
      redirect_to retailer_finished_products_path
  end

  private

  def get_user
      @user = current_user
  end

  def get_retailer
      @retailer = Retailer.find_by(params[:retailer_id])
  end

  def set_finished_product
      @finished_product= @retailer.finished_products.find(params[:id])
  end

  def finished_product_params
      params.require(:finished_product).permit(:product, :quantity, :users_attributes => [:user_id], :retailers_attributes => [:retailer_id])
  end

end