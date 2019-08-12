class AddNewCampsToUsers < ActiveRecord::Migration[5.2]
  def change
  	# add_column :users, :money, :float
  	# add_column :users, :blocked_money, :float
  	add_column :users, :name, :string
  	add_column :users, :admin, :integer
  end
end
