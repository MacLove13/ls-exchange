class CreateSafeInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :safe_investments do |t|
      t.integer :min_days
      t.integer :min_deposit
      t.integer :gain
      t.integer :available

      t.timestamps
    end
  end
end
