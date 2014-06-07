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

ActiveRecord::Schema.define(version: 20140607192250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plates", force: true do |t|
    t.string   "plate_number"
    t.string   "plate_image"
    t.string   "state"
    t.string   "status_code",                               default: "A"
    t.integer  "rated_count",                               default: 0
    t.decimal  "rating",            precision: 5, scale: 2, default: 0.0
    t.integer  "translation_votes",                         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "plates", ["user_id"], name: "index_plates_on_user_id", using: :btree

  create_table "translations", force: true do |t|
    t.string   "meaning"
    t.string   "status_code", default: "A"
    t.integer  "votes",       default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "plate_id"
  end

  add_index "translations", ["plate_id"], name: "index_translations_on_plate_id", using: :btree
  add_index "translations", ["user_id"], name: "index_translations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "status_code",     default: "A"
    t.integer  "plate_count",     default: 0
    t.boolean  "admin",           default: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
