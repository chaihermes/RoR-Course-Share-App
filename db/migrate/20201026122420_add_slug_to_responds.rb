class AddSlugToResponds < ActiveRecord::Migration[5.1]
  def change
    add_column :responds, :slug, :string
  end
end
