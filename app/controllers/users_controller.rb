class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    return @Error = 'Você não tem acesso a esta página' if !user_signed_in?
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
      return
    end 

    if params[:search]
      p params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all.order('id ASC')
    end
  end

  def admin_edit
    return @Error = 'Você não tem acesso a esta página' if !user_signed_in? || !current_user.admin?
    if !user_signed_in? || !current_user.admin? || current_user.admin <  3
      redirect_to root_path
      return
    end 

    @user = User.find(params[:id])
  end

  def update_user
    return @Error = 'Você não tem acesso a esta página' if !user_signed_in? || !current_user.admin?
    if !user_signed_in? || !current_user.admin? || current_user.admin <  3
      redirect_to root_path
      return
    end 

    user = User.find(params[:id])

    user.money = params[:money].to_i if params[:money]
    user.blocked_money = params[:blocked_money].to_i if params[:blocked_money]
    user.name = params[:name] if params[:name]
    user.email = params[:email] if params[:email]
    user.admin = params[:admin] if params[:admin]

    user.save

    @user = user
  end

  def show
    return @Error = 'Você não tem acesso a esta página' if !user_signed_in? || !current_user.admin?
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
      return
    end 

	  @user = User.find(params[:id])
  end
end
