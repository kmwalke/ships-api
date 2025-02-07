class CreateNewtons < ActiveRecord::Migration[8.0]
  def change
    create_table :newtons do |t|
      t.datetime :last_updated
    end
  end
end
