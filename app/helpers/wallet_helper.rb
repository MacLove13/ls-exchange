module WalletHelper
	def calculate_gain(quantity, purchased_value, current_value)
		
    total_spend = purchased_value * quantity
    actual_value = current_value * quantity

    (total_spend - actual_value).round(2)
	end
end
