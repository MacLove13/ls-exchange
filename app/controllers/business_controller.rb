class BusinessController < ApplicationController

  MAX_HISTORY_RECORDS = 10

  def index
  	@business = Business.page(params[:page])
  end

  def show
  	@business = Business.find(params[:id])

  	@history = BusinessValueHistory.where(:business_id => @business.id).order('created_at DESC').limit(MAX_HISTORY_RECORDS).reverse
  end
end
