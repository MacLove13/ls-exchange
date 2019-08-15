class AdminController < ApplicationController
  def dashboard
  	if !user_signed_in? || !current_user.admin?

  		redirect_to root_path
  		return
  	end 

  	lucro_total = 0
    @total_quotes_purchased = 0
  	@total_gain = 0
    @total_quotes_price = 0

  	@quotes = Quote.all

  	@quotes.each do |quote|

  		lucro_total = 0

  		total_spend = (quote.purchased_value * quote.quantity)
    	actual_value = (quote.current_price * quote.quantity)

  		lucro_total = (actual_value - total_spend).round(2)

      @total_gain = (@total_gain + lucro_total).round(2)
      @total_quotes_purchased = @total_quotes_purchased + quote.quantity
      @total_quotes_price = @total_quotes_price + (quote.quantity * quote.purchased_value)
  	end

  	@available_quotes = Business.sum('available_quotes')
  	purch = Business.sum('purchased_quotes')
  	total_quotes = @available_quotes + purch

  	@total_quotes_all = (@quotes.count * 100) / total_quotes

  	@percent = @total_quotes_all.to_s + '%'

  	@wallet_total_money = User.sum('money')

    @total_users = User.count
  	
  end
end
