class RemoveIndexFromMasterscores < ActiveRecord::Migration[5.0]
  def change
    remove_index :masterscores, [:user_id, :course_id]
  end
end
