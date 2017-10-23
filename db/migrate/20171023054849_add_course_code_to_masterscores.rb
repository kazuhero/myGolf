class AddCourseCodeToMasterscores < ActiveRecord::Migration[5.0]
  def change
    add_column :masterscores, :course_code, :string
  end
end
