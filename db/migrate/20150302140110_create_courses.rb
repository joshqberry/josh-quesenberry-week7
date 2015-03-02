class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.boolean :day_or_night

      t.timestamps null: false
    end
  end
end
