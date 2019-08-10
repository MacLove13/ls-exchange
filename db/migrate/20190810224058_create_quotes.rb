class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :owner_id
      t.integer :business_id
      t.float :purchased_value
      t.integer :quantity

      t.timestamps
    end
  end
end
