class AddCourseToSatellite < ActiveRecord::Migration[8.0]
  def change
    add_column :satellites, :current_course_id, :integer
  end
end
