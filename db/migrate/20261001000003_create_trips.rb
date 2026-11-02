class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true
      t.string :pickup, null: false
      t.string :dropoff, null: false
      t.string :status, null: false, default: "scheduled" # scheduled | in_progress | completed | cancelled
      t.datetime :scheduled_at, null: false
      t.datetime :completed_at
      t.timestamps
    end
    add_index :trips, :status
  end
end
