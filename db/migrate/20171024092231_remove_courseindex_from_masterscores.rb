class RemoveCourseindexFromMasterscores < ActiveRecord::Migration[5.0]
  def change
    remove_reference :masterscores, :course, foreign_key: true
  end
end
