class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Admin level
    #
    # 3 - Acess edit user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :cellphone, presence: true

  def self.search(search)
    if search
      where("name LIKE ?", search)
    else
      find(:all)
    end
  end

  def quotes
    @quotes ||= Quote.find_by(owner_id: self.id)
  end

  def business_quotes(business_id)
    @quotes ||= Quote.where(owner_id: self.id, business_id: business_id)
  end

  def admin?
    self.admin.present? && self.admin > 0
  end

  def give_money(quantity)
    money = self.money + quantity.round(2)
    self.update(money: money)
  end

  def withdraw_money(quantity)
    money = self.money - quantity.round(2)
    self.update(money: money)
  end
end
