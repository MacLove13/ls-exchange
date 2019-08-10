class BusinessController < ApplicationController

  LAST_RECORDS = 10

  def show
  	@business = Business.find(params[:id])

  	@history = BusinessValueHistory.where(:business_id => @business.id).order('created_at DESC').limit(LAST_RECORDS).reverse
  end
end
