class BusinessController < ApplicationController

  def index
  	@business = Business.page(params[:page])
  end

  def show
  	@business = Business.find(params[:id])
  end
end
