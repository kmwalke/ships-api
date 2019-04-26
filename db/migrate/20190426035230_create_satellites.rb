class CreateSatellites < ActiveRecord::Migration[5.2]
  def change
    create_table :satellites do |t|
      t.string :name
      t.bigint :pos_x
      t.bigint :pos_y
      t.bigint :pos_z
      t.integer :vel_x
      t.integer :vel_y
      t.integer :vel_z
      t.datetime :last_updated
    end
  end
end
