class CreateFlightPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :flight_plans do |t|
      t.integer :satellite_id, null: false
      t.boolean :save_plan, null: false, default: false
      t.string :name
      t.integer :current_step

      t.timestamps
    end
  end
end
