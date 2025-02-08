class CreateFlightPlanSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :flight_plan_steps do |t|
      t.integer :flight_plan_id, null: false
      t.integer :time, null: false
      t.integer :orientation, null: false
    end
  end
end
