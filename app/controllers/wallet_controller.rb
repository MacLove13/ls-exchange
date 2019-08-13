class WalletController < ApplicationController
  def index
  	return @error = 'dont_logged' if !user_signed_in?

  	@quotes = Quote.where(owner_id: current_user.id).order('name')
  end
end
