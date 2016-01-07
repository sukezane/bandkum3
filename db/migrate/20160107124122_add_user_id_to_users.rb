class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :string
    add_column :users, :Birth_date, :integer
    add_column :users, :gender, :text
    add_column :users, :part_1, :string
    add_column :users, :start_at_part_1, :integer
    add_column :users, :part_2, :string
    add_column :users, :start_at_part_2, :integer
    add_column :users, :current_place, :string
    add_column :users, :start_at_band, :integer
  end
end
