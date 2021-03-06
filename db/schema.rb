# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_22_105145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.text "description"
    t.bigint "place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reservations_count"
    t.index ["place_id"], name: "index_events_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_id"
    t.bigint "seat_id"
    t.integer "seats_count"
    t.index ["event_id"], name: "index_places_on_event_id"
    t.index ["seat_id"], name: "index_places_on_seat_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "status"
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "amount"
    t.integer "seats_count"
    t.index ["event_id"], name: "index_reservations_on_event_id"
  end

  create_table "seat_reservations", force: :cascade do |t|
    t.bigint "seat_id", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_seat_reservations_on_reservation_id"
    t.index ["seat_id"], name: "index_seat_reservations_on_seat_id"
  end

  create_table "seats", force: :cascade do |t|
    t.text "row"
    t.integer "seat_number"
    t.bigint "place_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_seats_on_place_id"
  end

  add_foreign_key "events", "places"
  add_foreign_key "places", "events"
  add_foreign_key "reservations", "events"
  add_foreign_key "seat_reservations", "reservations"
  add_foreign_key "seat_reservations", "seats"
  add_foreign_key "seats", "places"
end
