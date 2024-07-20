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

ActiveRecord::Schema[7.0].define(version: 2024_07_19_172956) do
  create_table "client_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "pick_up_address", default: "", null: false
    t.string "drop_off_address", default: "", null: false
    t.string "phone", default: "", null: false
    t.boolean "paid", default: false, null: false
    t.float "paid_value", default: 0.0, null: false
    t.integer "client_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "destination_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.float "value", default: 0.0, null: false
    t.integer "expense_type_id"
    t.integer "user_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer "number_load", default: 0, null: false
    t.boolean "paid", default: false, null: false
    t.float "paid_value", default: 0.0, null: false
    t.float "weight", default: 0.0, null: false
    t.integer "giver_id"
    t.integer "receiver_id"
    t.integer "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["giver_id"], name: "index_packages_on_giver_id"
    t.index ["passenger_id"], name: "index_packages_on_passenger_id"
    t.index ["receiver_id"], name: "index_packages_on_receiver_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_trips_on_destination_id"
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "trip_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "packages", "clients", column: "giver_id"
  add_foreign_key "packages", "clients", column: "passenger_id"
  add_foreign_key "packages", "clients", column: "receiver_id"
end
