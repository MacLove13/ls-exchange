class WalletController < ApplicationController
  def index
  	return @error = 'dont_logged' if !user_signed_in?

  	@quotes = Quotes.find_by(owner_id: current_user.id)
  end
end
