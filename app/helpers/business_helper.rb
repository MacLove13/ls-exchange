module BusinessHelper

	def calculate_movimentation(valueHistory)
		valuesHistory = valueHistory.order('created_at DESC').limit(2).reverse

    	return 0 if valuesHistory.nil?

		first = valuesHistory.first
		last = valuesHistory.last

		finalValue = last.value.round(2) - first.value.round(2)
	end

	def calculate_variation(valueHistory)
		valuesHistory = valueHistory.order('created_at DESC').limit(2).reverse

		first = valuesHistory.first
		last = valuesHistory.last

		return 0 if first.value.round(2) == last.value.round(2)

		result = first.value.round(2) / last.value.round(2)
		result = result / first.value.round(2)
		result = result * 100
		result.round(2)
	end

	def define_icon(valueHistory)
		valuesHistory = valueHistory.order('created_at DESC').limit(2).reverse

		first = valuesHistory.first
		last = valuesHistory.last

		if last.value.round(2) == first.value.round(2)
			icon('fas', 'minus')
		elsif last.value.round(2) > first.value.round(2)
			icon('fas', 'arrow-up', class: 'arrow-up')
		else
			icon('fas', 'arrow-down', class: 'arrow-down')
		end
	end

	def action_value(valueHistory)
		valuesHistory = valueHistory.order('created_at DESC').limit(1).reverse
		valuesHistory = valuesHistory.last
		valuesHistory.value
	end
end
