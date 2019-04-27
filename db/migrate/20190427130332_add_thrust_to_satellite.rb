class AddThrustToSatellite < ActiveRecord::Migration[5.2]
  def change
    add_column :satellites, :thrust_x, :integer
    add_column :satellites, :thrust_y, :integer
    add_column :satellites, :thrust_z, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE satellites set thrust_x = 0, thrust_y = 0, thrust_z = 0
        SQL
      end

      dir.down do
      end
    end
  end
end
