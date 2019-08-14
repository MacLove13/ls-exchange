class WalletController < ApplicationController
	def show
    return @error = 'dont_logged' if !user_signed_in? ||current_user.admin?

    @quotes = Quote.where(owner_id: params[:id]).page(1)
	end

  def index
  	return @error = 'dont_logged' if !user_signed_in?

  	@quotes = Quote.where(owner_id: current_user.id).page(params[:page])
  end
end
