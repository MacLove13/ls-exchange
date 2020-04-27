class BusinessController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
  	@business = Business.where(bankrupt: nil).order(:name).page(params[:page])

  end

  def show
  	@business = Business.find(params[:id])
  end

  def bankrupt
  	@business = Business.where(bankrupt: true).order(:name).page(params[:page])

  end
end
