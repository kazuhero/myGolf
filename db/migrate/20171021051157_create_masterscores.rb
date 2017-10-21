class CreateMasterscores < ActiveRecord::Migration[5.0]
  def change
    create_table :masterscores do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.references :score, foreign_key: true
      t.int :total

      t.timestamps
      
      t.index [:user_id, :course_id, :score_id], unique: true
      
    end
  end
end
