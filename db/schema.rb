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

ActiveRecord::Schema.define(version: 2021_04_09_123048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "complainants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "surname"
    t.string "firstname"
    t.datetime "dob"
    t.string "nationality"
    t.string "address"
    t.string "occupation"
    t.string "phone"
    t.string "gender"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_complainants_on_user_id"
  end

  create_table "crime_categories", force: :cascade do |t|
    t.bigint "crime_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_crime_categories_on_category_id"
    t.index ["crime_id"], name: "index_crime_categories_on_crime_id"
  end

  create_table "crimes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "accuser"
    t.string "accused"
    t.string "unknown_others"
    t.datetime "date"
    t.string "statements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_crimes_on_user_id"
  end

  create_table "first_information_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "complainant_id", null: false
    t.string "offense"
    t.datetime "date"
    t.string "location"
    t.string "suspect_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.boolean "active", default: true
    t.index ["complainant_id"], name: "index_first_information_reports_on_complainant_id"
    t.index ["user_id"], name: "index_first_information_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "phone"
    t.string "address"
    t.string "avatar", default: "https://res.cloudinary.com/teekaytech/image/upload/v1617721019/npf_sj2ta5.png"
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "complainants", "users"
  add_foreign_key "crime_categories", "categories"
  add_foreign_key "crime_categories", "crimes"
  add_foreign_key "crimes", "users"
  add_foreign_key "first_information_reports", "complainants"
  add_foreign_key "first_information_reports", "users"
end
