class CreateDrivers < ActiveRecord::Migration[7.2]
  def change
    create_table :drivers do |t|
      t.string :name, null: false
      t.string :vehicle, null: false
      t.string :plate, null: false
      t.timestamps
    end
    add_index :drivers, :plate, unique: true
  end
end
