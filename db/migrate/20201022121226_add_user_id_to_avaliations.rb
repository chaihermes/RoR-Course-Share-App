class AddUserIdToAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliations, :user_id, :integer
  end
end
