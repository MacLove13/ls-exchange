class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :owner_id
      t.integer :value

      t.timestamps
    end
  end
end
