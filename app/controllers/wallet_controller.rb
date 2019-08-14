class WalletController < ApplicationController
	def show
    return @error = 'Você não está logado ou não tem permissão para ver essa página' if !user_signed_in? || !current_user.admin?

    @user = User.find_by(id: params[:id])

    return @error = 'Usuário não encontrado' if @user.nil?

    @quotes = Quote.where(owner_id: @user.id)

    return @error = 'Carteira não encontrada' if @quotes.nil?
	end

  def index
  	return @error = 'dont_logged' if !user_signed_in? || !current_user.admin?

  	@quotes = Quote.where(owner_id: current_user.id).page(params[:page])
  end
end
