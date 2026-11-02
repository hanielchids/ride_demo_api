# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_11_02_231331) do
  create_table "drivers", force: :cascade do |t|
    t.string "name", null: false
    t.string "vehicle", null: false
    t.string "plate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plate"], name: "index_drivers_on_plate", unique: true
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_passengers_on_email", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "score", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_ratings_on_trip_id", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "passenger_id", null: false
    t.string "pickup", null: false
    t.string "dropoff", null: false
    t.string "status", default: "scheduled", null: false
    t.datetime "scheduled_at", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["passenger_id"], name: "index_trips_on_passenger_id"
    t.index ["status"], name: "index_trips_on_status"
  end

  add_foreign_key "ratings", "trips"
  add_foreign_key "trips", "drivers"
  add_foreign_key "trips", "passengers"
end
