class AddUserIdToResponds < ActiveRecord::Migration[5.1]
  def change
    add_column :responds, :user_id, :integer
  end
end
