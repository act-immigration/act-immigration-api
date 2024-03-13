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

ActiveRecord::Schema[7.1].define(version: 2024_03_13_211018) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "appointment_date"
    t.string "service_type"
    t.string "venue"
    t.text "elaborate"
    t.bigint "contact_info_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_info_id"], name: "index_appointments_on_contact_info_id"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phonenumber"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phonenumber"
    t.string "email"
    t.string "gender"
    t.date "dob"
    t.string "marital_status"
    t.text "residential_address"
    t.string "immigration_status"
    t.date "entry_date"
    t.string "passport_number"
    t.string "reference_number"
    t.string "service_type"
    t.text "elaborate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_info_id", null: false
    t.index ["contact_info_id"], name: "index_enquiries_on_contact_info_id"
  end

  add_foreign_key "appointments", "contact_infos"
  add_foreign_key "enquiries", "contact_infos"
end
