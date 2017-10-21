class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :name
      t.string :address
      t.string :description
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
