class Business < ApplicationRecord

	def value_history
		@values ||= BusinessValueHistory.where(business_id: self.id)
	end
end
