# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160123031607) do

  create_table "cruise_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cruises", force: :cascade do |t|
    t.string   "Types"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "scheduled_cruise_id"
    t.string   "name"
    t.string   "address_line_1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "coupon_code"
    t.string   "additional_information"
    t.string   "email"
  end

  add_index "reservations", ["scheduled_cruise_id"], name: "index_reservations_on_scheduled_cruise_id"

  create_table "scheduled_cruises", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cruise_type_id"
    t.datetime "datetime"
  end

  add_index "scheduled_cruises", ["cruise_type_id"], name: "index_scheduled_cruises_on_cruise_type_id"

end
