class CreateSatellites < ActiveRecord::Migration[5.2]
  def change
    create_table :satellites do |t|
      t.string :name
      t.bigint :x_pos
      t.bigint :y_pos
      t.bigint :z_pos
      t.integer :x_vel
      t.integer :y_vel
      t.integer :z_vel
      t.datetime :last_updated
    end
  end
end
