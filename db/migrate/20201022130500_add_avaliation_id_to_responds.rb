class AddAvaliationIdToResponds < ActiveRecord::Migration[5.1]
  def change
    add_column :responds, :avaliation_id, :integer
  end
end
