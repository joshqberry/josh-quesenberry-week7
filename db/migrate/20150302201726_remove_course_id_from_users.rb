class RemoveCourseIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :course_id, :integer
  end
end
