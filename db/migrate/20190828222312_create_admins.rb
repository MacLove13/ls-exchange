class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.integer :add_value_max
      t.integer :add_value_min
      t.integer :profit_quotes_sold

      t.timestamps
    end
  end
end
