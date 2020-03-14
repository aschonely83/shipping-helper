class FinishedProductsController < ApplicationController
  def new
    @finished_product = Finished_Product.new
  end

  def index
    @finished_products = Finished_Product.all
  end

  def create
    @finished_product = Finished_Product.new(finished_product_params(:product, :quantity))
    finished_product.save
    redirect_to retailer_finished_product_path(@finished_product.retailer, @finished_product)
  end

  def edit
    @finished_product = Finished_Product.find(params[:id])
  end

  def update
    @finished_product = Finished_Product.find(params[:id])
    @finished_product.update(finished_product_params(:product))
    redirect_to retailer_finished_product_path(@finished_product.retailer, @finished_product)
  end

  private

  def finished_product_params(*args)
    params.require(:finished_product).permit(*args)
  end
end