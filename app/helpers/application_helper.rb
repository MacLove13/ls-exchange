module ApplicationHelper

	def number_to_currency_br(number)
	  number_to_currency(number, :unit => "$", :separator => ",", :delimiter => ".")
	end

  def is_admin?
    return false if current_user.admin.nil?
    current_user.admin > 0
  end

  def admin_level
    return 0 if current_user.admin.nil?
    current_user.admin
  end

end
