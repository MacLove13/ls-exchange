class ChangeValueToBeFloatInBusinessValueHistories < ActiveRecord::Migration[5.2]
  def change
  	    change_column :business_value_histories, :value, :float

  end
end
