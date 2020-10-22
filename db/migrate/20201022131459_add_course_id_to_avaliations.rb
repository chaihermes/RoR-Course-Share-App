class AddCourseIdToAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliations, :course_id, :intenger
  end
end
