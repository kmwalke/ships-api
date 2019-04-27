class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :access_level
    end

    add_index :groups, :name, unique: true
    add_index :groups, :access_level, unique: true

    create_table :users do |t|
      t.string :name
      t.string :token
      t.string :email
      t.string :password_digest
      t.references :group, foreign_key: true

      t.timestamps
    end

    add_index :users, :token
    add_index :users, :email
    add_index :users, :name
  end
end
