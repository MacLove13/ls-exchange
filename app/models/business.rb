class Business < ApplicationRecord
	paginates_per 15

	def value_history
		@values ||= BusinessValueHistory.where(business_id: self.id)
	end

	def history(num_rows)
		@history ||= BusinessValueHistory.where(:business_id => self.id).order('id DESC').limit(num_rows).reverse
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
