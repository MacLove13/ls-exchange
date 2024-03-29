class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def buy_quote
  	business = Business.find(params[:id])

  	buy_quantity = params[:buy_quantity].to_i
  	buy_value = params[:buy_value].to_f

    return @error = 'dont_logged' if !user_signed_in?
  	return @error = 'not_have_quotes_quantity' if buy_quantity > business.verify_available_quotes || buy_quantity < 1

  	historyValue = history_value(business.id)

    return @error = "buy_value" if buy_value != historyValue.value

    total_price = buy_quantity * historyValue.value

    return @error = 'not_have_money' if current_user.money.nil? || current_user.money < total_price

    Quote.create(
      owner_id: current_user.id,
      business_id: business.id,
      purchased_value: historyValue.value,
      quantity: buy_quantity
    )

    current_user.withdraw_money(total_price)

    avail_quotes = business.available_quotes - buy_quantity
    purch_quotes = business.purchased_quotes + buy_quantity

    business.update_attributes(available_quotes: avail_quotes, purchased_quotes: purch_quotes)

    @business_name = business.name
    @total_price = total_price
    @buy_quantity = buy_quantity

    Rails.logger.info("#{current_user.name} comprou #{buy_quantity} ações da #{business.name} (#{business.id}) por $#{buy_value} cada. Total: #{total_price}")
  end

  def sell_quote
    admin_config = Admin.find(1)

    quote = Quote.find(params[:id])
    business = Business.find(quote.business_id)
    sell_value = params[:sell_value].to_f

    return @error = 'dont_logged' if !user_signed_in?

    historyValue = history_value(business.id)

    return @error = "sell_value" if sell_value != historyValue.value

    total_value = quote.quantity * historyValue.value

    current_user.give_money(total_value)

    @business_name = business.name
    @total_price = total_value
    @sell_quantity = quote.quantity

    # =======
    # Profit
    profit = sell_value - quote.purchased_value

    profit_admin = admin_config.profit_quotes_sold + profit

    admin_config.update_attribute(:profit_quotes_sold, profit_admin)
    # =======

    Rails.logger.info("#{current_user.name} vendeu #{quote.quantity} ações da #{business.name} (#{business.id}) por $#{sell_value} cada. Total: #{total_value}")
  
    avail_quotes = business.available_quotes + quote.quantity
    purch_quotes = business.purchased_quotes - quote.quantity

    business.update_attributes(available_quotes: avail_quotes, purchased_quotes: purch_quotes)

    quote.delete
  end

  private

  def history_value(business_id)
    history ||= BusinessValueHistory.where(business_id: business_id).last
  end
end
