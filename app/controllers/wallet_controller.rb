class WalletController < ApplicationController
	def show
    if !user_signed_in? || !current_user.admin?

      redirect_to root_path
      return
    end

    @user = User.find_by(id: params[:id])

    return @error = 'Usuário não encontrado' if @user.nil?

    @quotes = Quote.where(owner_id: @user.id)

    return @error = 'Carteira não encontrada' if @quotes.nil?
	end

  def index
  	if !user_signed_in?

      redirect_to root_path
      return
    end 

  	@quotes = Quote.where(owner_id: current_user.id).page(params[:page])
  end
end
