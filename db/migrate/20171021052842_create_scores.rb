class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :hole_no
      t.integer :hole_score

      t.timestamps
    end
  end
end
