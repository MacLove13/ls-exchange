class CreateBusinessValueHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :business_value_histories do |t|
      t.integer :business_id
      t.integer :value

      t.timestamps
    end
  end
end
