class CreateFlightPlanSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :flight_plan_steps do |t|
      t.integer :flight_plan_id, null: false
      t.integer :duration, null: false
      t.datetime :end_time
      t.integer :orientation, null: false
      t.integer :thrust, null: false
    end
  end
end
