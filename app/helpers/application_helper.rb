module ApplicationHelper

	def number_to_currency_br(number)
	  number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
	end

  def is_admin?
    return false if current_user.admin.nil?
    current_user.admin > 0
  end

end
