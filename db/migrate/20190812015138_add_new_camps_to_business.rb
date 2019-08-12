class AddNewCampsToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :initials, :string
    add_column :businesses, :slogan, :string
    add_column :businesses, :available_quotes, :integer
    add_column :businesses, :purchased_quotes, :integer
  end
end
