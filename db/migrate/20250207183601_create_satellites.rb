class CreateSatellites < ActiveRecord::Migration[8.0]
  def change
    create_table :satellites do |t|
      t.string :name, null: false
      t.integer :position_x, null: false, default: 0
      t.integer :position_y, null: false, default: 0
      t.integer :orientation, null: false, default: 0
      t.integer :velocity, null: false, default: 0
      t.integer :thrust, null: false, default: 0

      t.timestamps
    end
  end
end
