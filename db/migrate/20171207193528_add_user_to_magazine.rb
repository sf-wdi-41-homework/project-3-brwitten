class AddUserToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :user_id, :integer
  end
end
