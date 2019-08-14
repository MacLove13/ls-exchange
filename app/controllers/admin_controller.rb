class AdminController < ApplicationController
  def dashboard
  	if !user_signed_in? || !current_user.admin?

  		redirect_to root_path
  		return
  	end 

  	lucro_total = 0
  	@total_gain = 0

  	@quotes = Quote.all

  	@quotes.each do |quote|

  		lucro_total = 0

  		total_spend = (quote.purchased_value * quote.quantity)
    	actual_value = (quote.current_price * quote.quantity)

  		lucro_total = (actual_value - total_spend).round(2)

  	end

  	@total_gain = @total_gain + lucro_total

  	@available_quotes = Business.all.sum('available_quotes')
  	purch = Business.all.sum('purchased_quotes')
  	total_quotes = @available_quotes + purch

  	@total_quotes_all = (@quotes.count * 100) / total_quotes

  	@percent = @total_quotes_all.to_s + '%'

  	@wallet_total_money = User.all.sum('money')
  	
  end
end
