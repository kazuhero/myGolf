class AddCourseNameToMasterscores < ActiveRecord::Migration[5.0]
  def change
    add_column :masterscores, :course_name, :string
  end
end
