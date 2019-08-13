class Quote < ApplicationRecord

	def business
		@business ||= Business.find_by(business_id: self.business_id)
	end

	def current_price
		@current ||= BusinessValueHistory.where(business_id: self.business_id).order('id DESC').limit(1).value
	end
end
