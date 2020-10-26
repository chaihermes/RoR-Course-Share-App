class AddSlugToAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliations, :slug, :string
  end
end
