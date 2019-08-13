class Quote < ApplicationRecord

	def business
		@business ||= Business.find_by(id: self.business_id)
	end

	def current_price
		@current ||= BusinessValueHistory.where(business_id: self.business_id).order('id DESC').limit(1) if @current.nil?

    @current.last.value
	end
end
