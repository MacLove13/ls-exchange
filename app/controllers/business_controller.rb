class BusinessController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
  	@business = Business.order(:name).page(params[:page])

  end

  def show
  	@business = Business.find(params[:id])
  end
end
