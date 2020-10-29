class AddProductIdToAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliations, :product_id, :integer
  end
end
