class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
