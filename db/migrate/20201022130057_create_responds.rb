class CreateResponds < ActiveRecord::Migration[5.1]
  def change
    create_table :responds do |t|
      t.text :respond

      t.timestamps
    end
  end
end
