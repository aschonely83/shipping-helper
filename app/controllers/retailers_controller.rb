class RetailersController < ApplicationController
  def new
    @retailer = Retailer.new
  end

  def create
    @retailer = Retailer.create(retailer_params(:name, :schedule))
    @retailer.save
    redirect_to retailer_path(@retailer)
  end

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    retailer.update(retailer_params(:name))
    redirect_to retailer_path(@retailer)
  end

  def index
    @retailers = Retailer.all
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  def edit
    
  end

  

  private

  def retailer_params(*args)
    params.required(:retailer).permit(*args)
  end
end