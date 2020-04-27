class AddBlockedMoneyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blocked_money, :float
  end
end
