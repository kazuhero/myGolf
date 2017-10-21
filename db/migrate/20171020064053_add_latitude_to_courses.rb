class AddLatitudeToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :latitude, :float
  end
end
