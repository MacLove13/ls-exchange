module WalletHelper
	def calculate_gain(quantity, purchased_value, current_value)
		
    total_spend = (purchased_value.round(2) * quantity)
    actual_value = (current_value.round(2) * quantity)

    @price = (actual_value.round(2) - total_spend.round(2)).round(2)
	end
end
