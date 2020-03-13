class FinishedProductsController < ApplicationController
  def new
    @finished_product = Finished_Product.new
  end

  def index
    @finished_products = Finished_Product.all
  end

  def create
    byebug
    @finished_product = Finished_Product.new(finished_product_params)
    finished_product.save
    redirect_to retailer_finished_product_path(@finished_product.retailer, @finished_product)
  end

  private

  def finished_product_params
    params.require(:finished_product).permit(:product, :quantity, :user_id, :retailer_id)
  end
end