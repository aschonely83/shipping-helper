class RetailersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]

  def index
    @retailers = Retailer.all
  end

  def show
   @retailer = Retailer.find(params[:id])
  end

  def new
    @retailer = Retailer.new
    @retailer.finished_products.build
  end

  def edit
  end

  def create
    @retailer = Retailer.new(retailer_params)
    if @retailer.save
      redirect_to retailer_path(@retailer)
    else
      render :new
    end
  end

  def update
    if @retailer.update(retailer_params)
      redirect_to retailer_path(@retailer)
    else 
      render :edit
    end
  end

  def destroy
    @retailer.destroy
    redirect_to retailers_path
  end

  private

  def set_retailer
    @retailer = Retailer.find(params[:id])
  end

  def retailer_params
    params.require(:retailer).permit(:name, :schedule)
  end
end