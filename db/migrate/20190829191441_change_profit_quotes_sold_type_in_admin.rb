class ChangeProfitQuotesSoldTypeInAdmin < ActiveRecord::Migration[5.2]
  def change
  	change_column :admins, :profit_quotes_sold, :float
  end
end
