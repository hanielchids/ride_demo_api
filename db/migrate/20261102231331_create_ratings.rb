class CreateRatings < ActiveRecord::Migration[7.2]
  def change
    create_table :ratings, id: :integer do |t|
      t.references :trip, null: false, foreign_key: true, type: :integer, index: { unique: true }
      t.integer :score, null: false
      t.text :comment

      t.timestamps
    end
  end
end
