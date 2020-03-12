class RetailersController < ApplicationController
  def new
    @retailer = Retailer.new
  end

  def index
    @retailers = Retailer.all
  end

  def create
    @retailer = Retailer.new(retailer_params)
    if @retailer.save
      redirect_to retailers_path
    else  
      render :new
    end
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  private

  def retailer_params
    params.required(:retailer).permit(:name, :schedule)
  end
end