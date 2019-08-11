class Business < ApplicationRecord

	def value_history
		@values ||= BusinessValueHistory.where(business_id: self.id)
	end

	def history(num_rows)
		@history ||= BusinessValueHistory.where(:business_id => self.id).order('created_at DESC').limit(num_rows).reverse
	end

	def verify_available_quotes
		self.available_quotes
	end

	def verify_purchased_quotes
		self.purchased_quotes
	end

	def total_quotes
		self.available_quotes + self.purchased_quotes
	end
end
