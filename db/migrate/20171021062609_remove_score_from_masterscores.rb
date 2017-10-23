class RemoveScoreFromMasterscores < ActiveRecord::Migration[5.0]
  def change
    remove_reference :masterscores, :score, foreign_key: true
  end
end
