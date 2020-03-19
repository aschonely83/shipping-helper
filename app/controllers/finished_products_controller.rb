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
  end
      
  def new
    @finished_product = @user.finished_products.build
  end

  def create
    @finished_product = @user.finished_products.build(finished_product_params)
    @finished_product.retailer_id = @retailer.id
    if @finished_product.save
      redirect_to retailer_finished_products_path(@retailer), notice: "Product was successfully created"
    else
      render :new
    end
  end

  def edit
       
  end

  def update
    if @finished_product.update(finished_product_params)
      redirect_to retailer_finished_product_path(@finished_product),  notice: 'Finished Product has been updated'
    else
      render :edit
    end
  end

  def destroy
    @finished_product.destroy
    redirect_to retailer_finished_products_path, notice: 'Finished Product has been deleted'
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
    params.require(:finished_product).permit(:product, :quantity, :user_id, :retailer_id)
  end
end