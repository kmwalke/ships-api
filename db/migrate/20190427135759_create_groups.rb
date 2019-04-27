class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :access_level
    end

    add_index :groups, :name, unique: true
    add_index :groups, :access_level, unique: true
  end
end
