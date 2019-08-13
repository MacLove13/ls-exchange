module WalletHelper
	def calculate_gain(quantity, purchased_value, current_value)
		
    total_spend = (purchased_value * quantity).round(2)
    actual_value = (current_value * quantity).round(2)

    @price = (actual_value - total_spend).round(2)
	end
end
