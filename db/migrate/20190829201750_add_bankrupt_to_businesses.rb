class AddBankruptToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :bankrupt, :boolean
  end
end
