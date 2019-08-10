class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:search]
      p params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  def find

  end

  def admin_edit
    @user = User.find(params[:id])
  end

  def update_user
    user = User.find(params[:id])

    user.money = params[:money].to_i if params[:money]
    user.blocked_money = params[:blocked_money].to_i if params[:blocked_money]
    user.name = params[:name] if params[:name]
    user.email = params[:email] if params[:email]

    user.save

    @user = user
  end

  def show
	  @user = User.find(params[:id])
  end
end
