class CreateAvaliations < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliations do |t|
      t.string :title
      t.text :content
      t.integer :note

      t.timestamps
    end
  end
end
