class AddMoneyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :money, :float
  end
end
