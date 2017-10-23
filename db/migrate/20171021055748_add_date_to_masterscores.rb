class AddDateToMasterscores < ActiveRecord::Migration[5.0]
  def change
    add_column :masterscores, :date, :date
  end
end
