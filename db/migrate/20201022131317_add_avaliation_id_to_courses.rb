class AddAvaliationIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :avaliation_id, :integer
  end
end
