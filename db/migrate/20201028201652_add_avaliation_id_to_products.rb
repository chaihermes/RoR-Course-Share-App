class AddAvaliationIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :avaliation_id, :integer
  end
end
