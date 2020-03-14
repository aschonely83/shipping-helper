class RetailersController < ApplicationController
  
  def new
    @retailer = Retailer.new
  end
    
  def create
    @retailer = Retailer.new(retailer_params)
    if @retailer.save
      redirect_to retailers_path(@retailer)
    else  
      render :new
    end
  end
    
  def index
    @retailers = Retailer.all
  end
    
  def show
    @Retailer = Retailer.find(params[:id])
  end
    
  def edit
        
  end
    
  private
    
  def retailer_params
    params.required(:retailer).permit(:name, :schedule)
  end
end