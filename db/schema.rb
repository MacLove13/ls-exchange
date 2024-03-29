# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_29_201750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer "add_value_max"
    t.integer "add_value_min"
    t.float "profit_quotes_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_value_histories", force: :cascade do |t|
    t.integer "business_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "initials"
    t.string "slogan"
    t.integer "available_quotes"
    t.integer "purchased_quotes"
    t.boolean "bankrupt"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "business_id"
    t.float "purchased_value"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "safe_investments", force: :cascade do |t|
    t.integer "min_days"
    t.integer "min_deposit"
    t.integer "gain"
    t.integer "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "money"
    t.float "blocked_money"
    t.string "name"
    t.integer "admin"
    t.string "cellphone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
