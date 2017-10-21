class AddLongitudeToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :longitude, :float
  end
end
